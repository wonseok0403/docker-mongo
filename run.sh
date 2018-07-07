docker build -t woobak/mongodb .

docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -e MONGODB_USERNAME=admin \
    -e MONGODB_PASSWORD=admin \
    woobak/mongodb
