FROM openjdk:11-jdk

# Cài đặt curl
RUN apt-get update && apt-get install -y curl

# Tải New Relic Java Agent
COPY newrelic.jar /newrelic.jar

# Thiết lập biến môi trường cho New Relic
ENV NEW_RELIC_LICENSE_KEY="90fe98028d8bb9e8ac64fc8eb7018924FFFFNRAL"
ENV NEW_RELIC_APP_NAME="MyJavaApp"

# Copy ứng dụng vào container
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

# Chạy ứng dụng với New Relic và lắng nghe tất cả interfaces
CMD ["java", "-javaagent:/newrelic.jar", "-Dserver.port=8080", "-Dserver.address=0.0.0.0", "-jar", "/app.jar"]
