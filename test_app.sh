#!/bin/bash
#containerctl="podman" # Change to "docker" if using Docker
containerctl="docker" # Change to "docker" if using Docker

IMAGE_NAME="flask_app_test_image"
CONTAINER_NAME="flask_app_test_container"

$containerctl build -t $IMAGE_NAME .
$containerctl rm -f $CONTAINER_NAME 2>/dev/null || true
$containerctl run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME

echo "Waiting for container to be ready..."
for i in {1..15}; do
    STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:5000/)
    if [ "$STATUS" == "200" ]; then
        echo "App is ready!"
        break
    fi
    sleep 1
done

echo "Testing '/' endpoint"
curl -s http://localhost:5000/ | grep "Hello, World!" && echo "PASS" || echo "FAIL"

echo "Testing '/get/' endpoint"
curl -s http://localhost:5000/get/10/20 | grep "Sum of 10 and 20 is 30" && echo "PASS" || echo "FAIL"

echo "Testing '/ten/' endpoint"
curl -s http://localhost:5000/ten/50 | grep "Ten times 50 is 500" && echo "PASS" || echo "FAIL"

echo "Cleaning up..."
$containerctl rm -f $CONTAINER_NAME
