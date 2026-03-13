#!/bin/bash

rama=$(git branch --show-current)

# Commit sin archivos que tienen '_nc'
git status -s | grep '^?' | grep -v '_nc' | awk '{print $2}' | xargs git add

# Commit de archivos
git commit -m "$1"

# Pusheo a la rama que exista
git push origin $rama

echo "COMMIT GUARDADO COMO: $(git log --oneline -1)"
