import re
import sys
from colorama import Fore 
from os import getcwd 
import os.path

pattern = r"[a-zA-Z0-9+/=\n]+"

def rsa_key_search(path):
    directory = getcwd()
    name_of_file = "rsa_keys"
    total = os.path.join(directory, name_of_file+" .txt")
    with open(path, "w") as f:
        result = re.findall(pattern, path)
        if result:
            with open(total, "w") as s:
                s.write(', '.join(result))
                s.close()
                f.close()
                input("Data saved succesfully!\nPress anything to close the script.")
                sys.exit()
        else:
                input("Something went wrong.")
                         

def main():
    while True:
               print("Welcome to RSA Key searcher!")
               print("Please, choose what do you want to do. ")
               print("1. Search for RSA Keys.")
               
               
               user_choice = int(input("Choose variant: "))                                                                                   
               choice_list = [1]
               if user_choice in choice_list:
                    print(Fore.RED + "Please, make sure you are running this script in the same folder as files with RSA keys.")
                    file_name = input("Please tell me the file name. Example: rsa_key.txt\nTell it: ")
                    rsa_key_search(file_name)
                    
if __name__ == "__main__" :
    main()                  
