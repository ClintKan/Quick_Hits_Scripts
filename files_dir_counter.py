import os #importing the 'os' module that deals with the operating system

print("A script that counts the number of files & directories in a specified directory")

files_count = 0
dirs_count = 0

dir = input ("Which directory do you want to do the search in?\n")

all_files_dirs = len(os.listdir(dir))

print(all_files_dirs)
