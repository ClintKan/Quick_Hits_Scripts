import os

print("A script that counts the number of files & directories in a specified directory")

files_count = 0

dir = input ("Which directory do you want to do the search in?\n")

print(len(os.listdir(dir)))
