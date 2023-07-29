#!/bin/bash

# Function to convert JSON to VMess link
convert_to_vmess() {
  # Encode the input JSON to base64
  local base64_encoded_config=$(echo -n "$1" | base64 | tr -d '\n')

  # Combine the base64-encoded configuration with the VMess link prefix
  local vmess_link="vmess://$base64_encoded_config"

  # Output the VMess link
  echo "$vmess_link"
}

# Check if the script is called with a JSON argument
if [ $# -eq 0 ]; then
  echo "Error: JSON input is missing. Usage: $0 '<json_config>'"
  exit 1
fi

# Get the JSON input from the command line argument
json_input="$1"

# Call the function to convert JSON to VMess link
vmess_link=$(convert_to_vmess "$json_input")

# Output the VMess link
echo "VMess Link:"
echo "$vmess_link"
