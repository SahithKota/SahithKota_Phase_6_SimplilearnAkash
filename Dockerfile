FROM openjdk:8-jdk-alpine
EXPOSE 8080
ADD target/spring-boot-medicare.jar spring-boot-medicare.jar
ENTRYPOINT ["java","-jar","/spring-boot-medicare.jar"]
