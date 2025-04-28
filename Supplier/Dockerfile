FROM openjdk:17-jdk-slim
VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
LABEL authors="neighborolive"

ENTRYPOINT ["java","-jar","/app.jar"]