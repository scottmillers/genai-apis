#!/bin/zsh


input_string=$(cat flux-io/dragon.txt)
output_image="flux-io/dragon.jpg"
model="fal-ai/flux-pro/v1.1-ultra"

# Run the Python script and pass the string as an argument
python request.py "$model" "$input_string" "$filename"
