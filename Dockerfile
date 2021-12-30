FROM openjdk:8-jdk-alpine
COPY wit-cicd-challenge.jar wit-cicd-challenge.jar
ENTRYPOINT ["java","-jar","wit-cicd-challenge.jar"]
