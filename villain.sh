#!/bin/bash
cd tools/Villain/ || { echo "Directory not found!"; exit 1; }  # Check if cd works
python3 ./Villain.py || { echo "Villain.py not found!"; exit 1; }  # Check if script runs
