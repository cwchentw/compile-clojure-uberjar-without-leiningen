# Compile Clojure Uber JAR without Leiningin

## Why Re-inventing the Wheel?

Contrary to common belief, [Leiningin](https://leiningen.org/) is not mandatory to build a uber jar from Clojure code base. In this repo, we build a tiny Clojure uber jar only with built-in Java tools and Clojure itself.

You should **NOT** adopt this pattern in production code. Instead, use community standard tools like Leiningin or [Boot](https://boot-clj.com/) to build your next awesome project. This repo is just a demonstration to a uber jar building process in vanilla.

## System Requirements

* JDK
* Clojure

Our repo bundle a Clojure JAR. Hence, you don't need to manage dependency issue.

We test our repo against OpenJDK.

## Usage

### Unix

Run *build* script to build *hello.jar*:

```
$ ./build
```

Run *hello.jar* with Java:

```
$ java -jar hello.jar
Hello World
```

### Windows

Pending.

## For Clojure Learner

If interested in the whole process to build a uber jar in vanilla tools, check the source of [build](/build/) script.

## Copyright

Copyright (c) 2020 Michael Chen. Licensed under MIT.
