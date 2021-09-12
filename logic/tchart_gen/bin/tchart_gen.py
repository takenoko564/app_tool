from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import re
import sys

imgw=0
imgh=0
scalex=0
scaley=0
#img = Image.new("RGB",(300,300),"red")
#img.save("./test.jpg")

def getScale(width, height, lines):
    wordnum=0
    for line in lines:
        words = re.split(":", line)
        if (len(words) != 2) :
            print("Error : The format is not correct")
            exit()
        words[1]=line
        if (wordnum <= len(words[1])):
            wordnum = len(words[1])
    scale_x = width / (wordnum+1)
    scale_y = height / len(lines)
    return int(scale_x), int(scale_y)

def drawText(img,basex,basey,word):
    do = ImageDraw.Draw(img)
    fontsize=int(scalex*2)
    font = ImageFont.truetype("mplus-1p-regular.ttf", fontsize)
    do.text((basex,basey),word,fill="black",font=font)

def drawChart(img,basex,basey,line):
    do = ImageDraw.Draw(img)
    scaley2 = scaley * 7 / 10
    wid=int(scaley/20)
    fontsize=int(scalex*2)
    font = ImageFont.truetype("mplus-1p-regular.ttf", fontsize)
    preword=""
    textbuf=""
    textanc=basex+(scalex/2)
    for i in range(len(line)):
        word=line[i]
        if (word == "_"):
            if (preword == "~"):
                do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            elif (preword == "-"):
                do.line([(basex+scalex*i,basey), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey+(scaley2/2)), (basex+scalex*(i+1),basey+(scaley2/2))], fill="black", width=wid)
        elif (word == "~"):
            if (preword == "_"):
                do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            elif (preword == "-"):
                do.line([(basex+scalex*i,basey), (basex+scalex*i,basey-(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*(i+1),basey-(scaley2/2))], fill="black", width=wid)
        elif (word == "-"):
            if (preword == "_"):
                do.line([(basex+scalex*i,basey), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            elif (preword == "~"):
                do.line([(basex+scalex*i,basey), (basex+scalex*i,basey-(scaley2/2))], fill="black", width=wid)
            elif (preword == "="):
                do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey), (basex+scalex*(i+1),basey)], fill="black", width=wid)
        elif (word == "="):
            if (textbuf != ""):
                do.text((textanc,basey-scaley2/2),textbuf,fill="black",font=font)
                textbuf=""
            do.line([(basex+scalex*i,basey+(scaley2/2)), (basex+scalex*(i+1),basey+(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*(i+1),basey-(scaley2/2))], fill="black", width=wid)
        else:
            if ((preword == "=") or (preword == "-")):
                textanc=(basex+scalex*i+scalex/2)
                do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*i,basey+(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey+(scaley2/2)), (basex+scalex*(i+1),basey+(scaley2/2))], fill="black", width=wid)
            do.line([(basex+scalex*i,basey-(scaley2/2)), (basex+scalex*(i+1),basey-(scaley2/2))], fill="black", width=wid)
            textbuf=textbuf+word
        preword=word

if __name__ == '__main__':
    if (len(sys.argv) != 2) :
        print("Error : Argument is not correct.")
        exit()
    srcpath = sys.argv[1]
    srcfp = open(srcpath)
    lines = srcfp.readlines()
    srcfp.close()

    for i in range(len(lines)):
        lines[i] = lines[i].replace('\r', '')
        lines[i] = lines[i].replace('\n', '')
        #line = line.rstrip('\n')
    
    ## Info Check
    line = lines.pop(0)
    words = re.split(",", line)
    imgw = int(words[0])
    imgh = int(words[1])
    img = Image.new("RGB",(imgw,imgh),"white")
    scalex, scaley = getScale(imgw,imgh,lines)
    print("----------------")
    print("sizeX :"+str(imgw)+" sizeY :"+str(imgh))
    print("scaleX:"+str(scalex)+" scaleY:"+str(scaley))
    print("----------------")

    ##
    for i in range(len(lines)):
        line = lines[i]
        words = re.split(":", line)
        if (len(words) != 2) :
            print("Error : The format is not correct")
            exit()
        print(words[1])
        drawText(img,scalex/2,(scaley*i)+(scaley/8),words[0])
        drawChart(img,scalex*(len(words[0])+1),(scaley*i)+(scaley/2),words[1])
    img.save("./chart.jpg")

