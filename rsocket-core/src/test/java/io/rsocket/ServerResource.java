package io.rsocket;

import io.rsocket.test.util.TestDuplexConnection;
import io.rsocket.test.util.TestSubscriber;
import io.rsocket.util.PayloadImpl;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.function.Function;
import org.reactivestreams.Subscriber;
import reactor.core.publisher.Mono;

public class ServerResource {
  private Function<Payload, Mono<Payload>> acceptor;

  private final Subscriber<Void> connectSub;
  private final RSocketServer socket;
  private final RSocket acceptingSocket;

  public final TestDuplexConnection connection;
  public final ConcurrentLinkedQueue<Throwable> errors;

  public ServerResource() {
    acceptor = Mono::just;
    connection = new TestDuplexConnection();
    connectSub = TestSubscriber.create();
    errors = new ConcurrentLinkedQueue<>();
    acceptingSocket =
        new AbstractRSocket() {
          @Override
          public Mono<Payload> requestResponse(Payload payload) {
            return acceptor.apply(payload);
          }
        };
    socket = new RSocketServer(connection, acceptingSocket, errors::add);
  }

  public void sendRequest(int streamId, FrameType frameType) {
    Frame request = Frame.Request.from(streamId, frameType, PayloadImpl.EMPTY, 1);
    connection.addToReceivedBuffer(request);
    connection.addToReceivedBuffer(Frame.RequestN.from(streamId, 2));
  }

  public void acceptor(Function<Payload, Mono<Payload>> acceptor) {
    this.acceptor = acceptor;
  }
}
