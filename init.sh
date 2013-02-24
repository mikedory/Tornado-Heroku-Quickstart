# Project creation script
# (for Tornado on Heroku)
#
# by Mike Dory | dory.me
# 11.12.11, last updated 02.04.13
# contributions by Tedb0t, gregory80

# --------------------------

echo "************************************"

# create directories (just in case they need creatin')
mkdir -p templates
mkdir -p static static/img static/css static/js

# setup the libs dirs
echo "Creating directories and fetching dependancies"
mkdir -p ./static/js/libs/jquery ./static/css/libs/normalize

# fetch yer dependancies
curl -o ./static/js/libs/jquery/jquery-1.8.3.min.js https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js
curl -o ./static/css/libs/normalize/normalize.css http://necolas.github.com/normalize.css/2.0.1/normalize.css

# --------------------------

# git!
git init

# --------------------------

# set up the basics
touch README.mdown

# --------------------------

# make a new Heroku app (or don't)
echo "Do you want to start a Heroku app as well?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./heroku.sh; break;;
        No ) echo "No worries, you can do that later via the heroku.sh file"; break;;
    esac
done

# no need for this file anymore, eh?
echo "Cleaning up..."
rm ./$0

# blam. 'tis done.
echo "Done!"
echo "************************************"
