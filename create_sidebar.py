import os
import re

root_dir = '/wiki'

def sorted_alphanumeric(data):
    convert = lambda text: int(text) if text.isdigit() else text.lower()
    alphanum_key = lambda key: [ convert(c) for c in re.split('([0-9]+)', key) ] 
    return sorted(data, key=alphanum_key)


f = open(f"{root_dir}/_Sidebar.md", "w+")
f.write("<!--- Generated by ProdIsMyDev/publish-to-wiki ---> \n")

def iterate_over_folder(directory):
    for filename in sorted_alphanumeric(os.listdir(directory)):
        if os.path.isfile(os.path.join(directory, filename)):
            f.write("  * " + "[" + filename.split("\.")[0] + "]" + "(" + "https://github.com/" + os.environ['GITHUB_REPOSITORY'] + "/wiki/" + filename.split("\.")[0] + ")" + "\n")
        else:
            folder_name_split_on_oblique = filename.split("/")
            f.write("* " + folder_name_split_on_oblique[len(folder_name_split_on_oblique) - 1] + "\n")
            f.write("  ")
            iterate_over_folder(os.path.join(directory, filename))
            
                   
for file in sorted_alphanumeric(os.listdir(root_dir)):
    if os.path.isfile(os.path.join(root_dir, file)):
        if "_Sidebar.md" not in file:
            f.write("* " + "[" + file.split("\.")[0] + "]" + "(" + "https://github.com/" + os.environ['GITHUB_REPOSITORY'] + "/wiki/" + file.split("\.")[0] + ")" + "\n")
    else:
        if ".git" not in file:
            folder_name_split_on_oblique = file.split("/")
            f.write("* " + folder_name_split_on_oblique[len(folder_name_split_on_oblique) - 1] + "\n")
            iterate_over_folder(os.path.join(root_dir, file))

        
f.close()
