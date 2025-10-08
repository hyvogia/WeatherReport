from tkinter import *
from tkinter.filedialog import askopenfilename
import os, json

def get_json_data():
    #steps to open file dialog
    root = Tk()
    root.update()
    filename = askopenfilename(
                                    title       = "Find Pokemon File",
                                    initialdir  =  os.path.dirname(os.path.abspath(__file__))
                               )
    #now read the file using the filename from the dialog selection
    p_file_obj = open(filename,"r")
    #close the file dialog
    root.destroy()
    #convert json file contents to python data structures
    pokemon_list = json.loads(p_file_obj.read())
    
    return pokemon_list
