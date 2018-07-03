#!/bin/bash

#task1
read -p "Folder Name Input =>" fname

mkdir $fname

a=1;
b=2;
c=3;
d=4;

ARRAY=($fname$a $fname$b $fname$c $fname$d)

echo "Files=>"
echo " "

for (( i=0;i<4;i++)); do
   # touch $fname/${ARRAY[${i}]}.txt
    echo $fname/${ARRAY[${i}]}.txt
    base64 /dev/urandom | head -c 100 > $fname/${ARRAY[${i}]}.txt
    #dd bs=10 count=104 </dev/urandom >$fname/${ARRAY[${i}]}.txt
done

zip -r $fname.zip /home/wgbl/Sandesh/$fname


#task2

reverse=""
 
len=${#fname}

for (( i=$len-1; i>=0; i-- ))
do 
	reverse="$reverse${fname:$i:1}"
done
 
echo "$reverse"

mkdir $reverse

chmod 0777 $reverse/

cp -r $fname/ $reverse/


echo "After Modification=> "

for (( i=0;i<4;i++)); do
   # touch $reverse/$fname/${ARRAY[${i}]}.txt
     echo $reverse/$fname/${ARRAY[${i}]}.txt
   # dd bs=10 count=104 </dev/urandom >$fname/${ARRAY[${i}]}.txt
done


#task3


cp -r $reverse/$fname/* $reverse/

rm -rf $reverse/$fname

echo " "
echo "After New Modification=> "

for (( i=0;i<4;i++)); do
   # touch $reverse/$fname/${ARRAY[${i}]}.txt
     echo $reverse/${ARRAY[${i}]}.txt
   # dd bs=10 count=104 </dev/urandom >$fname/${ARRAY[${i}]}.txt
done


#task4

for (( i=0;i<4;i++)); do
   # touch $reverse/$fname/${ARRAY[${i}]}.txt
     echo -e "${ARRAY[${i}]}.txt Content.."
     echo -e " "
     cat $reverse/${ARRAY[${i}]}.txt
     echo -e " "
   # dd bs=10 count=104 </dev/urandom >$fname/${ARRAY[${i}]}.txt
done

