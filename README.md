# RSocket

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/08fb65a4bb214c23a8fe156f6e173c3b)](https://www.codacy.com/app/alnovoselov/rsocket-java?utm_source=github.com&utm_medium=referral&utm_content=qweek/rsocket-java&utm_campaign=badger)
[![Join the chat at https://gitter.im/RSocket/reactivesocket-java](https://badges.gitter.im/RSocket/reactivesocket-java.svg)](https://gitter.im/RSocket/reactivesocket-java?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

RSocket is a binary protocol for use on byte stream transports such as TCP, WebSockets, and Aeron.

It enables the following symmetric interaction models via async message passing over a single connection:

- request/response (stream of 1)
- request/stream (finite stream of many)
- fire-and-forget (no response)
- event subscription (infinite stream of many)

Learn more at http://rsocket.io

## Build and Binaries

<a href='https://travis-ci.org/rsocket/rsocket-java/builds'><img src='https://travis-ci.org/rsocket/rsocket-java.svg?branch=1.0.x'></a>

Snapshots are available via JFrog.

Example:

```groovy
repositories {
    maven { url 'https://oss.jfrog.org/libs-snapshot' }
}

dependencies {
    compile 'io.rsocket:reactivesocket:0.9-SNAPSHOT'
}
```

No releases to Maven Central or JCenter have occurred yet.

## Development

Install the google-java-format in Intellij, from Plugins preferences.
Enable under Preferences -> Other Settings -> google-java-format Settings

Format automatically with

```
$./gradlew goJF
```

## Debugging
Frames can be printed out to help debugging. Set the logger `io.rsocket.FrameLogger` to debug to print the frames.

## Requirements

- Java 8 - heavy dependence on Java 8 functional APIs and java.time, also on Reactor
- Android O - https://github.com/rsocket/rsocket-demo-android-java8

## Bugs and Feedback

For bugs, questions and discussions please use the [Github Issues](https://github.com/RSocket/reactivesocket-java/issues).

## LICENSE

Copyright 2015 Netflix, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
