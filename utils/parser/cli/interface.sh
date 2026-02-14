cd ../../../src 
CATEGORY=$(ls -d */ | fzf)
cd "$CATEGORY"
ls | fzf --preview="rich --force-terminal {}" --preview-window=70% 
