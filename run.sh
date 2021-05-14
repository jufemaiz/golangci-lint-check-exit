#!/bin/bash

version="${1:-"v1.40.0"}"

docker run --rm -v $(pwd)/:/app -w /app golangci/golangci-lint:$version golangci-lint run -v ./withtodo/...
output=$?

echo "Checking error output with 'TODO':"
if [ "$output" == "1" ]; then
  echo "output error = '$output'"
else
  echo "output passed with '$output'"
fi

docker run --rm -v $(pwd)/:/app -w /app golangci/golangci-lint:$version golangci-lint run -v ./withtoddo/...
output=$?

echo "Checking error output with 'TODDO':"
if [ "$output" == "1" ]; then
  echo "output error = '$output'"
else
  echo "output passed with '$output'"
fi

exit 0
