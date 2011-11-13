# Project creation script
# (for Tornado on Heroku)
#
# by Mike Dory | dory.me
# 11.12.11

# --------------------------

# git!
git init

# set up the gitignore
touch .gitignore
echo "bin
build
include
lib
*.pyc
.DS_Store
.svn
" >> .gitignore

# --------------------------

# set up the basics
touch README.mdown

# set up the pip requirements
touch requirements.txt
echo "Tornado==2.1.1" >> requirements.txt

# set up the Procfile
touch Procfile
echo "web: python main.py" >> Procfile

# --------------------------

# set up directories
mkdir static
mkdir static/js
mkdir static/images
mkdir static/css
mkdir templates
mkdir templates/modules

# static file conventions
touch static/js/script.js
touch static/css/style.css
touch static/images/favicon.ico

# file name convetions
touch main.py
touch templates/main.html
touch templates/home.html

# --------------------------

echo "new project created!"