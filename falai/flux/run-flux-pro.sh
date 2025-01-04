#!/bin/bash
# Bash script to activate the virtual environment and run the text-to-image.py script with
# input parameters
source "myvenv/bin/activate"

model="fal-ai/flux-pro/v1.1-ultra"

#input_text=$(cat flux-io/dragon.txt)
#output_filename="flux-io/dragon.jpg"

input_text=$(cat flux-io/yoga.txt)
output_filename="flux-io/yoga.jpg"



# Create a JSON string with the input text and output filename
model_arguments=$(jq -n --arg prompt "$input_text"  '{prompt: $prompt}')
echo $model_arguments



# Run the Python script and pass the string as an argument
python text-to-image.py "$model" "$model_arguments" "$output_filename"

