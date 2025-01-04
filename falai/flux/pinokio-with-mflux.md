# Install Pinokio AI


These instructions install Pinokio AI with the MFlux model on my Mac.  This is took a very long time to run

## Install the Ollama

Ollama lets you get up and running with large language models like Llama 3.2, Phi 3, Mistral, and Gemma2.

Steps:
1. Go to https://ollama.com/download
2. Click download
3. Open the zip file
4. Put in Application folder
5. Open the terminal
6. Run this command
   ```
   ollama run llama3.2
   ```

## Install the Open WebUi

Prerequisites: Ollama

Steps:

1. Go to https://github.com/open-webui/open-webui
2. Start docker
3. Install with the default configuration
   
   `
   docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
   `

4. Go to the open-webui docker container and open the web page

5. Create an Admin account
   
   - Name: Scott Miller
   - Email: scott_millers@hotmail.com
   - Password: Passw0rd321
   

## Install Pinokio

Prerequisites: Ollama

Steps:
1. Go to pinokio.computer
2. Download for the Mac
https://program.pinokio.computer/#/?id=mac

3. Install MFlux-WebUI
   