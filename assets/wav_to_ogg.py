
# Script that converts all wav files in and bellow the current directory to ogg files.
# Requires ffmpeg to be installed.

import os
import subprocess

py_path = os.path.dirname(os.path.abspath(__file__))

for root, _, files in os.walk(py_path):
	for file in files:
		if file.endswith(".wav"):
			src = f"{root}/{file}"
			dst = src.replace(".wav", ".ogg")
			subprocess.run(["ffmpeg", "-i", src, dst])
print("Conversion finished!")

