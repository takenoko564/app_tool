#!/usr/bin/python
import sys
import re

indent_a  = "  "
indent_b  = "    "
width_ofs = 4

module_flag = 0
module_name = ""
port_state  = 0
port_list   = []

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
                    port_state = 1
                    continue
                if ("[" in word) :
                    if (port_state == 1) :
                        port_state = 2
                if ("]" in word) :
                    if (port_state == 2) :
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
                    port_list.append(word)
                    port_state = 0

    width = 0
    for port in port_list :
        if (width < len(port)) :
            width = len(port)
    width += width_ofs
    print(indent_a+module_name+"u_"+module_name+" (")
    for port in port_list :
        if (port == port_list[-1]) :
            print(indent_b+"."+port.ljust(width," ")+"("+(" "*width)+")")
        else :
            print(indent_b+"."+port.ljust(width," ")+"("+(" "*width)+"),")
    print(indent_a+");")

    fp.close()









