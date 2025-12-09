FROM docker.io/library/maven:3.9-eclipse-temurin-21

WORKDIR /app

COPY . .

RUN . /app/hermeto.env && mvn clean install

CMD ["java", "-jar", "target/hello-world-1.0-SNAPSHOT.jar"]
