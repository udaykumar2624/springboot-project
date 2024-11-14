#
FROM ubuntu AS build 

WORKDIR /app
COPY . .
RUN apt-get update && apt install openjdk-17-jdk maven -y
RUN mvn clean package
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/*.jar spring.jar


CMD ["java", "-jar", "spring.jar"]

EXPOSE 9090
