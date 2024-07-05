#!/bin/bash

# Set the input and output folder paths
input_folder="/Users/chicong/video_compression/input"
output_folder="/Users/chicong/video_compression/output"

# Loop through all video files in the input folder
for file in "$input_folder"/*.MOV; do
  # Extract the filename without extension
  filename=$(basename "$file" .MOV)
  
  # Compose the output file path
  output_file="$output_folder/${filename}_compressed.MOV" 
  
  # Compress the video using FFmpeg
  ffmpeg -i "$file" -c:v libx264 -crf 40 -preset medium -c:a copy -map_metadata 0 "$output_file"
done