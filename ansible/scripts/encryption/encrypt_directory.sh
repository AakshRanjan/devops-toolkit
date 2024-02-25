#!/bin/zsh

# source my zsh aliases.
source ~/.zshrc

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <encrypted_file_path>"
    exit 1
fi

# Assign arguments to variables
directory_path=$1
encrypted_file_path=$2

# Set flag to track the first iteration
first_iteration=true

# Iterate over each file in the directory
for file_path in "$directory_path"/*; do
    # Extract the file name without the directory path
    file_name=$(basename "$file_path")
    # Replace '.' with '_' in file name
    file_name=${file_name//./_}
    # Extract the content of the file
    while IFS= read -r line; do
        file_content="$file_content$line\n"
    done < "$file_path"
    # Encrypt the content using ansible-vault
    if [ "$first_iteration" = true ]; then
        ansible-vault encrypt_string "$file_content" --name "$file_name" --vault-password-file ~/.ansible-vault.txt > "$encrypted_file_path"
        # Set flag to false after the first iteration
        first_iteration=false
    else
        ansible-vault encrypt_string "$file_content" --name "$file_name" --vault-password-file ~/.ansible-vault.txt >> "$encrypted_file_path"
    fi
done