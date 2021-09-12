#!/usr/bin/python
import sys
import re

ofname = "port.csv"

module_flag = 0
module_name = ""
port_state  = 0
port_list   = []

port_dir   = ""
port_width = ""

class io_port():
    name = ""
    dir = ""
    width = ""
    def __init__(self, name, dir, width):
        self.name  = name
        self.dir   = dir
        self.width = width

if __name__ == '__main__':
    print("Generate Verilog Module Instance.")
    if (len(sys.argv) != 2):
        print("Error:Argument is not correct.")
        exit()
    fname = sys.argv[1]
    print("Input File :" + fname)

    fp = open(fname,"r")
    lines = fp.readlines()
    for line in lines :
        words = re.split("[ \s#(,;]",line)
        if("endmodule" in line) :
            module_flag = 0
            port_state = 0
        elif("module" in line) :
            module_flag = 1
            module_name = words[1]
            print("Module Name : "+module_name)
        if(module_flag == 1) :
            for word in words :
                if ((word == "input" ) or
                    (word == "output") or
                    (word == "inout" ) ):
                    port_dir = word
                    port_state = 1
                    continue
                if (("[" in word) and ("]" in word)):
                    if (port_state == 1) :
                        port_width = port_width + word                    
                        port_state = 1
                        continue
                if ("[" in word) :
                    if (port_state == 1) :
                        port_width = port_width + word
                        port_state = 2
                if ("]" in word) :
                    if (port_state == 2) :
                        port_width = port_width + word
                        port_state = 1
                        continue
                if ((word == "wire" ) or
                    (word == "reg"  ) or
                    (word == "logic") or
                    (word == "bit"  ) ):
                    continue            
                if (word == "") :
                    continue
                if (port_state == 1) :
                    port_list.append(io_port(word,port_dir,port_width))
                    port_state = 0
                    port_dir   = ""
                    port_width = ""
    fp.close()

    fp = open(ofname,"w")
    fp.write("Name,Direction,Bit\n")
    for port in port_list :
        fp.write(port.name+","+port.dir+","+port.width+"\n")
        ##print(port.name+" "+port.dir+" "+port.width)
    fp.close()









