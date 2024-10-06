#!/bin/bash

echo "Ingrese formato a guardar (.txt, .jpg, .png, etc) incluyendo punto."
read formato

textFiles=$(ls -l | grep "${formato}" | wc -l)

if [ $textFiles -gt 0 ];
then
	if ! [ -d ./"${formato}"_Files ];
	then
		mkdir "${formato}_Files"
	fi
	for file in *"${formato}"
	do
		mv "$file" ./"${formato}"_Files
	done
fi

echo "Files sent."
fecha=$(date)
echo "$textFiles archivos de tipo $formato fueron procesados el $fecha" >> ./"${formato}_Files"/script.log
