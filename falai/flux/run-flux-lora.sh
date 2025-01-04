#!/bin/bash
# Bash script to activate the virtual environment and run the text-to-image.py script with
# input parameters
source "myvenv/bin/activate"

model="fal-ai/flux-lora"

# Modify this to be your own loRA model URL
lora_url="https://v3.fal.media/files/rabbit/BD8qvVJ8qu53cC77uzAr7_pytorch_lora_weights.safetensors"

# Modify this to be the text file of your input prompt
input_text=$(cat flux-io/me-jedi.txt)
# Modify this to be the location of your image file
output_filename="flux-io/me-jedi.jpg"



# Create a JSON string with the input text and output filename
model_arguments=$(jq -n --arg prompt "$input_text" --arg lora_url "$lora_url" '{prompt: $prompt, loras: [{path: $lora_url, scale:1}]}')
echo model_arguments


# Run the Python script and pass the string as an argument
python text-to-image.py "$model" "$model_arguments" "$output_filename"


