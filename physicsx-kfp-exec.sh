#!/bin/sh

set -eu

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <component_distribution> <component_name> <input_file_path> <output_file_path>" >&2
    exit 1
fi

component_distribution="$1"
component_name="$2"
input_file_path="$3"
output_file_path="$4"

uvx physicsx-component-host \
  --with "https://danilohorta.github.io/file/physicsx_component_protocol-0.1.0-py3-none-any.whl" -- \
  --with "https://danilohorta.github.io/file/physicsx_component_host-0.1.0-py3-none-any.whl" -- \
  --with "$component_distribution" -- \
  --component-name "$component_name" \
  --input-file-path "$input_file_path" \
  --output-file-path "$output_file_path"
