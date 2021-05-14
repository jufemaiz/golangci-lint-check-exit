#!/bin/bash

docker run --rm -v $(pwd)/:/app -w /app golangci/golangci-lint:v1.40.0 golangci-lint run -v ./withtodo/...
output=$?

echo "Checking error output with 'TODO':"
if [ "$output" == "1" ]; then
  echo "output error = '$output'"
else
  echo "output passed with '$output'"
fi

docker run --rm -v $(pwd)/:/app -w /app golangci/golangci-lint:v1.40.0 golangci-lint run -v ./withtoddo/...
output=$?

echo "Checking error output with 'TODDO':"
if [ "$output" == "1" ]; then
  echo "output error = '$output'"
else
  echo "output passed with '$output'"
fi

exit 0
