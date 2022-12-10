FROM eclipse-temurin:19-jre-alpine as runner

RUN mkdir /app
WORKDIR /app
COPY build/libs/app.jar /app/app.jar

CMD java -jar /app/app.jar