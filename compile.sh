cd chezkavod
COMPILE_TARGETS=$(find . -name "*.typ") 

for i in $COMPILE_TARGETS; do 
	DIR=$(echo $i | cut -d '/' -f 2)
	FILE=$(echo $i |cut -d '/' -f 3 | cut -d '.' -f 1)
	PDF_FILEPATH="../dist/$DIR/$FILE.pdf"
	echo $PDF_FILEPATH; 
	typst compile $i $PDF_FILEPATH
done
	

#cd chezkavod/ && for i in `find . -name "*.typ"`; do typst compile --format svg $$i ../../math/svg/$$(echo $$i | cut -d '/' -f 3 | cut -d '.' -f 1).svg; done

