#!/bin/bash


input_file="$HOME/.config/picom/picom.conf"
output_file="flashfocus.yml"

# If output file exists, keep only content up to "rules:"
if [[ -f "$output_file" ]]; then
    sed -i '/^rules:/Q' "$output_file"
fi

# Print "rules:" to the output file
echo "rules:" >> "$output_file"

# Extract lines between the specified delimiters from the input file
content=$(awk '/opacity-rule = \[/,/\];/' "$input_file")

# Process each line to extract number and class name, then format the output and append to output file
echo "$content" | awk -F':' '/^[[:space:]]*"[0-9]+:/ { gsub(/[" ]/, "", $1); opacity=$1/100; gsub(/[" ,]/, "", $2); split($2, a, "="); printf "  - window-class: %s\n    default-opacity: %.2f\n", a[2], opacity }' >> "$output_file"
