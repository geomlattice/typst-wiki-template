CHOSEN_DIR=$(cd src && ls -d */ | fzf \
  --preview="ls -ha --color {}" --preview-window=70% \
)
#since chosen dir is returned as `documentation/` writing `/*.typ` would be redundant 
TYP_SUBSET=$(ls src/${CHOSEN_DIR}*.typ)
#CHOSEN_FILE=$(ls src/${CHOSEN_DIR}*.typ | fzf --preview="rich --force-terminal {}" --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window "70%")
TYP_CHOICES=$(echo "$TYP_SUBSET" | cut -d'/' -f3)
CHOSEN_FILE=$(echo "$TYP_CHOICES" | fzf --preview="rich --force-terminal src/$CHOSEN_DIR/{}" --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window "70%")
#source: https://stackoverflow.com/questions/39162967/compare-substrings-in-busybox-ash
echo "$CHOSEN_FILE"
#if [ $CHOSEN_FILE == "src/${CHOSEN_DIR}template.typ" ]
if [ $CHOSEN_FILE == 'template.typ' ]
then
  #TODO: setup template file
  echo "template chosen"
  #source: https://www.geeksforgeeks.org/linux-unix/bash-script-read-user-input/
  read -p "newfile name: " NEWFILE
  cp "src/${CHOSEN_DIR}template.typ" "src/${CHOSEN_DIR}${NEWFILE}.typ"
  #$EDITOR "${NEWFILE}.typ"   
  nvim "src/${CHOSEN_DIR}${NEWFILE}.typ"
else
  #$EDITOR $CHOSEN_FILE   
  #nvim $CHOSEN_FILE   
  nvim "src/${CHOSEN_DIR}${CHOSEN_FILE}" 
fi
