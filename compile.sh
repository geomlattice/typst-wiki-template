mkdir -p dist/philosophers
mkdir -p dist/mathematicians
mkdir -p dist/topics
mkdir -p dist/scholastic

cd chezkavod
COMPILE_TARGETS=$(find . -name "*.typ") 

for i in $COMPILE_TARGETS; do 
	echo $i
	if [ $i == "./index.typ" ]; then 
		#typst compile --features html --format html $i "../dist/index.html"
    		cp "./index.html" "../dist" && cp $i "../dist" && cp "../README.md" "../dist"
    		echo "index is compiled later via html embedded javascript"
	elif [ $i == "./lib.typ" ]; then
		echo "lib.typ should not be directly compiled"	
	elif [ $(echo $i | cut -d '/' -f 3) == "lib.typ" ]; then
		echo "subdir level lib.typ should not be directly compiled"
	else
		DIR=$(echo $i | cut -d '/' -f 2)
		FILE=$(echo $i |cut -d '/' -f 3 | cut -d '.' -f 1)
		PDF_FILEPATH="../dist/$DIR/$FILE.pdf"
		echo $PDF_FILEPATH; 
		typst compile $i $PDF_FILEPATH
	fi
done
