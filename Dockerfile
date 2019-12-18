FROM openjdk:8-jdk-alpine
ADD target/sample-web_springboot-kubernetes-docker-1.0-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
EXPOSE 8099