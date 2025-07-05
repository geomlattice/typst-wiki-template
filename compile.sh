mkdir -p dist/philosophers
mkdir -p dist/mathematicians

cd chezkavod
COMPILE_TARGETS=$(find . -name "*.typ") 

for i in $COMPILE_TARGETS; do 
	echo $i
	if [ $i == "./index.typ" ]; then 
		typst compile --features html --format html $i "../dist/index.html"
	else
		DIR=$(echo $i | cut -d '/' -f 2)
		FILE=$(echo $i |cut -d '/' -f 3 | cut -d '.' -f 1)
		PDF_FILEPATH="../dist/$DIR/$FILE.pdf"
		echo $PDF_FILEPATH; 
		typst compile $i $PDF_FILEPATH
	fi
done
	

#cd chezkavod/ && for i in `find . -name "*.typ"`; do typst compile --format svg $$i ../../math/svg/$$(echo $$i | cut -d '/' -f 3 | cut -d '.' -f 1).svg; done

