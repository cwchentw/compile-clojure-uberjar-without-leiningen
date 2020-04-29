# Compile Clojure Uber JAR without Leiningen

## Why Re-inventing the Wheel?

Contrary to common belief, [Leiningen](https://leiningen.org/) is not mandatory to build a uber jar from Clojure code base. In this repo, we build a tiny Clojure uber jar only with built-in Java tools and Clojure itself.

You should **NOT** adopt this pattern in production code. Instead, use community standard tools like Leiningen or [Boot](https://boot-clj.com/) to build your next awesome Clojure project. This repo is just a demonstration to a uber jar building process in vanilla.

## System Requirements

* JDK
* Clojure

Our repo bundle a Clojure JAR. Hence, you don't need to manage dependency issue.

We test our repo against OpenJDK.

## Usage

### Windows

Run *build.bat* script to build *hello.jar*:

```
> ./build.bat
```

Run *hello.jar* with Java:

```
> java -jar hello.jar
Hello World
```

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

## For Clojure Learners

If interested in the whole process to build a uber jar only with plain tools, check the source of [build](/build/) script or [build.bat](/build.bat/) script.

## Copyright

Copyright (c) 2020 Michael Chen. Licensed under MIT.
