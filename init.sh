# Project creation script
# (for Tornado on Heroku)
#
# by Mike Dory | dory.me
# 11.12.11, updated 11.24.12
# updated by Tedb0t | tedbot.com

# --------------------------

mkdir -p ./templates/static/js/libs/jquery ./templates/static/js/libs/modernizr


# fetch yer dependancies
curl -o ./templates/static/js/libs/jquery/jquery-1.8.3.min.js https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js

# --------------------------

# git!
git init

# --------------------------

# set up the basics
touch README.mdown

# --------------------------


# no need for this file anymore, eh?

echo "Cleaning up..."

rm ./$0

echo "Done!"
