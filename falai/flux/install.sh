#!/bin/bash

# Create a virtual environment
python3 -m venv myvenv

# Activate the virtual environment
source myvenv/bin/activate

# Install the required libraries
pip install fal_client requests

# Deactivate the virtual environment
deactivate

echo "Python libraries installed successfully in the virtual environment called myvenv."