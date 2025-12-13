mkdir -p dist/philosophers
mkdir -p dist/mathematicians
mkdir -p dist/topics
mkdir -p dist/scholastic

cd src
COMPILE_TARGETS=$(find . -name "*.typ") 

for i in $COMPILE_TARGETS; do 
	echo $i
	if [ $i == "./index.typ" ]; then 
		#typst compile --features html --format html $i "../dist/index.html"
    		cp "./index.html" "../dist" && cp $i "../dist"
    		echo "index is compiled later via html embedded javascript"
	elif [ $i == "./lib.typ" ]; then
		echo "lib.typ should not be directly compiled"	
	elif [ $(echo $i | cut -d '/' -f 3) == "lib.typ" ]; then
		echo "subdir level lib.typ should not be directly compiled"
	else
		DIR=$(echo $i | cut -d '/' -f 2)
		FILE=$(echo $i |cut -d '/' -f 3 | cut -d '.' -f 1)
	  HTML_FILEPATH="../dist/$DIR/$FILE.html"
		echo $HTML_FILEPATH; 
		typst compile --format html --features html $i $HTML_FILEPATH
    echo "<link rel="stylesheet" type="text/css" href="test_styles_out.css" />" >> $HTML_FILEPATH
	fi
done

#leave source; go back to root
cd ..

tailwindcss -i dist/philosophers/test_styles.css -o dist/philosophers/test_styles_out.css
tailwindcss -i dist/mathematicians/test_styles.css -o dist/mathematicians/test_styles_out.css
tailwindcss -i dist/topics/test_styles.css -o dist/topics/test_styles_out.css
tailwindcss -i dist/scholastic/test_styles.css -o dist/scholastic/test_styles_out.css
