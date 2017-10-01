# RSocket

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

## Tools

[CircleCI](https://circleci.com) [![CircleCI](https://circleci.com/gh/qweek/rsocket-java.svg?style=svg)](https://circleci.com/gh/qweek/rsocket-java)

[Travis CI](https://travis-ci.org) [![Build Status](https://travis-ci.org/qweek/rsocket-java.svg?branch=1.0.x)](https://travis-ci.org/qweek/rsocket-java)

[Semaphore](https://semaphoreci.com) [![Build Status](https://semaphoreci.com/api/v1/qweek/rsocket-java/branches/1-0-x/shields_badge.svg)](https://semaphoreci.com/qweek/rsocket-java)

[Shippable](https://app.shippable.com) [![Run Status](https://api.shippable.com/projects/59cffb5c9ea08107008c7a36/badge?branch=1.0.x)](https://app.shippable.com/github/qweek/rsocket-java) [![Coverage Badge](https://api.shippable.com/projects/59cffb5c9ea08107008c7a36/coverageBadge?branch=1.0.x)](https://app.shippable.com/github/qweek/rsocket-java)

[AppVeyor](https://ci.appveyor.com) [![Build status](https://ci.appveyor.com/api/projects/status/2dtdi7fua85rbov5?svg=true)](https://ci.appveyor.com/project/qweek/rsocket-java)

[Bitrise](https://www.bitrise.io) [![Build Status](https://www.bitrise.io/app/ff59b1f25934eac1/status.svg?token=4_4LGvHsGih2UBoC4BHHJA&branch=1.0.x)](https://www.bitrise.io/app/ff59b1f25934eac1)

[CodeFresh](https://g.codefresh.io) [![Codefresh build status]( https://g.codefresh.io/api/badges/build?repoOwner=qweek&repoName=rsocket-java&branch=1.0.x&pipelineName=rsocket-java&accountName=qweek&type=cf-1)]( https://g.codefresh.io/repositories/qweek/rsocket-java/builds?filter=trigger:build;branch:1.0.x;service:59d00fc413a5900001d43380~rsocket-java)

[Codeship](https://app.codeship.com) [![Codeship Status for qweek/rsocket-java](https://app.codeship.com/projects/cb0c9ab0-8854-0135-190f-026946df6204/status?branch=1.0.x)](https://app.codeship.com/projects/248464)

[Wercker](https://app.wercker.com) [![wercker status](https://app.wercker.com/status/e2cee7efd15d4a2695e8cc1e01552507/s/master "wercker status")](https://app.wercker.com/project/byKey/e2cee7efd15d4a2695e8cc1e01552507)

[Snyk](https://snyk.io/) [![Known Vulnerabilities](https://snyk.io/test/github/qweek/rsocket-java/badge.svg)](https://snyk.io/test/github/qweek/rsocket-java)

[Codacy](https://www.codacy.com) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/08fb65a4bb214c23a8fe156f6e173c3b)](https://www.codacy.com/app/alnovoselov/rsocket-java?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=qweek/rsocket-java&amp;utm_campaign=Badge_Grade)

[Codebeat](https://codebeat.co) [![codebeat badge](https://codebeat.co/badges/24549025-d4cc-40b8-a522-d22268371dbe)](https://codebeat.co/projects/github-com-qweek-rsocket-java-1-0-x)

[Better Code Hub](https://bettercodehub.com) [![BCH compliance](https://bettercodehub.com/edge/badge/qweek/rsocket-java?branch=1.0.x)](https://bettercodehub.com/)

[Codecov](https://codecov.io) [![codecov](https://codecov.io/gh/qweek/rsocket-java/branch/1.0.x/graph/badge.svg)](https://codecov.io/gh/qweek/rsocket-java)

[Coveralls](https://coveralls.io) [![Coverage Status](https://coveralls.io/repos/github/qweek/rsocket-java/badge.svg?branch=1.0.x)](https://coveralls.io/github/qweek/rsocket-java?branch=1.0.x)

[Gemnasium](https://gemnasium.com) [![Dependency Status](https://gemnasium.com/badges/github.com/qweek/rsocket-java.svg)](https://gemnasium.com/github.com/qweek/rsocket-java)

[Code Climate](https://codeclimate.com)

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
