# Generate Realistic Headshots using Flux using the Fal UI

These instructions use the [fal.ai](https://fal.ai/) with the Flux. [Flux](https://blackforestlabs.ai/ultra-home/#get-flux) is a AI text to image generation model from BlackForestLabs. 

There are two parts.  
   - Part1 uses a the [flux-pro/v1.1-ultra](https://fal.ai/models/fal-ai/flux-pro/v1.1-ultra) api to generate a image directly from the prompt
   - Part2 uses the [flux-lora-fast-training](https://fal.ai/models/fal-ai/flux-lora-fast-training) to create a lora for the [flux-lora(Flux.1[dev])](https://fal.ai/models/fal-ai/flux-lora?from_training=c9c29034-83c2-4654-b455-e35a7ccc1ead)





## Prerequisites:
- Sign up on [Fal.ai]((https://fal.ai/) ) using your GitHub account. You will need to buy credit. I purchased $20 in credit.



## How to use the flux-pro/v1.1-ultra model to generate an image from text

1. Make sure you export your flux API key
   ```
      export FAL_KEY="YOUR_API_KEY"
   ```
2. Setup your python virtual environment called `myvenv`
   ```
   ./install.sh
   ```
3. Generate the first image
   ```
   run-flux-pro.sh
   ```
4. Edit the run-flux-pro.sh file to generate a new image
   ```


## Use the fal-ai/flux-lora model to generate a image trained with a lora

How a LoRA to train the flux model on your selfies

1. Take photos of 15-20 selfie in various angles 

2. Put them in a folder
   
3. Rename the photos so they have your name in them.  For example, photo_of_scottmiller_XXXX.jpg

4. Zip the photos

5. Add the images to the [fal-ai/flux-lora-fast-training model](https://fal.ai/models/fal-ai/flux-lora-fast-training)

6. Set the Trigger word as your name. My Trigger word is `scottmiller`

7. Start the training 

8. Once the training is done click 'run inference'
 
9. Specify the prompt that includes the keyword of your name

How to use your selfies to generate new images

1. Get the Loral URL

2. Edit `run-flux-lora.sh` and modify the lora_url to be your LoRA url
   ```  
      # Modify this to be your own loRA model URL
      lora_url="https://v3.fal.media/files/rabbit/BD8qvVJ8qu53cC77uzAr7_pytorch_lora_weights.safetensors"

      # Modify this to be the text file of your input prompt
      input_text=$(cat flux-io/me-jedi.txt)
      
      # Modify this to be the location of your image file
      output_filename="flux-io/me-jedi.jpg"
   ```

3. Verify that your input prompt has your Trigger keyword included. For example, my trigger keyword is `scottmillers`

4. Run the model
   ```
   run-flux-lora.sh
   ```



## Reference

- Follow the instructions to setup the [Fal api client for python](https://fal.ai/models/fal-ai/flux-pro/v1.1-ultra/api?platform=python)

- This [Youtube video form Julia McCoy](https://www.youtube.com/watch?v=lcNb-0XspwU&t=360s) is the basis this work.


