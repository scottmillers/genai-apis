import fal_client
import json
import requests
import sys

def on_queue_update(update):
    if isinstance(update, fal_client.InProgress):
        for log in update.logs:
           print(log["message"])

def generate_image(model, model_arguments):
    # Subscribe to the FAL AI service

   

    result = fal_client.subscribe(
        model,
        arguments=model_arguments,
        with_logs=True,
        on_queue_update=on_queue_update,
    )

    return result

def download_image(image_url, file_name):
    # Download the image
    response = requests.get(image_url)
    if response.status_code == 200:
        with open(file_name, 'wb') as f:
            f.write(response.content)
        print('Image downloaded successfully.')
    else:
        print('Failed to download image.')



if len(sys.argv) > 3:
    model = sys.argv[1]
    print(f"Model: {model}")
    model_arguments_json = sys.argv[2]
    print(f"Model Arguments JSON: {model_arguments_json}")
    output_image = sys.argv[3]
    print(f"Output image: {output_image}")
else:
    print("No input received.")
    sys.exit(1)


# Convert the JSON string to a python dictionary
model_arguments = json.loads(model_arguments_json)

# Call the API function with the model and model arguments
result = generate_image(model, model_arguments)

print(json.dumps(result, indent=4))


# Extract image URL
image_url = result['images'][0]['url']

print(f"Image URL: {image_url}")

# Call the function with the image URL and desired file name
download_image(image_url, output_image)