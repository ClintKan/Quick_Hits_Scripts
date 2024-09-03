import os #importing the 'os' module that deals with the operating system

print("A script that counts the number of files & directories in a specified directory")

files_count = 0 #starting count of files at 0
dirs_count = 0 #starting count of directories at 0

dir = input ("Which directory do you want to do the search in?\n")

all_files_dirs = os.listdir(dir)

print(f"There is a total of {len(os.listdir(dir))} files and folders. But...\n")

for item in all_files_dirs:
    full_path = os.path.join(dir, item)
    if os.path.isfile(full_path):
        files_count = files_count +1
print(f"There are {files_count} files.\n")

for folders in all_files_dirs:
    full_path = os.path.join(dir, folders)
    if os.path.isdir(full_path):
        dirs_count = dirs_count +1
print(f"There are {dirs_count} directories\n")
