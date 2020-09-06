
**Regular Expression

^ start
$ end
* any
? singleCharacter

**AWK


**SED

sed -n 20p filename.txt // prints 20th line
sed -i -e 20d filename.txt // deletes 20th line
sed -i -e '2d;10,15d' filename.txt // deletes 2,10,11,12,13,14,15 lines 
sed -i 's/old-text/new-text/g' filename.txt. // subtitutes old with new text



