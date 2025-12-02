# Instructions

## Check the Maven version

```bash
mvn -v
```

## Create a new project

```bash
mvn archetype:generate -DgroupId=com.example -DartifactId=hello-world -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

## Run the application

```bash
mvn exec:java
```

## Build the image offline

Each command requires different plugins and dependencies, so the size of the local repository may vary.
This is not the official way to vendor the plugins and dependencies, but it is possible to change
the default local repository path to a different directory that serves as a cache for the plugins
and dependencies.

```bash
mvn -Dmaven.repo.local=./hermeto-output/deps/maven clean package
podman build --no-cache --network none --tag my-image .
```

## Build the image offline with [maven-lockfile](https://github.com/chains-project/maven-lockfile) and [hermeto](https://github.com/slimreaper35/hermeto/tree/maven)

1. Generate the lockfile

```bash
mvn -DincludeMavenPlugins=true io.github.chains-project:maven-lockfile:generate
hermeto fetch-deps maven
hermeto generate-env ...
podman build ...
```

## Appendix

### A lot of Maven commands

> **NOTE**
>
> It is possible to combine the `clean` command with other commands. For example,
> `mvn clean compile` will clean the project and then compile the main Java source code.

#### mvn compile

Compiles the main Java source code. Useful for checking if the code compiles.

#### mvn test

Runs the test phase.

#### mvn package

Creates a package of the application. This does not install the JAR into the local repository.

#### mvn install

Installs the POM artifact into the local Maven repository.

#### mvn clean

Deletes the `target/` directory. Because Maven doesn't automatically remove old compiled files.
