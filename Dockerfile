# 1. Updated from Java 8 to Java 21 (using eclipse-temurin for a slim alpine base)
FROM eclipse-temurin:21-jre-alpine

# 2. Alpine comes with /bin/sh by default, so we removed the redundant apk add step
RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME
EXPOSE 8080

# 3. Cleaned up the execution command array
CMD ["java", "-jar", "spring-boot-mongo.jar"]
