# Project creation script
# (for Tornado on Heroku)
#
# by Mike Dory | dory.me
# 11.12.11, updated 11.24.12
# updated by Tedb0t | tedbot.com

# --------------------------

# setup the libs dirs
mkdir -p ./templates/static/js/libs/jquery ./templates/static/css/libs/normalize

# fetch yer dependancies
curl -o ./templates/static/js/libs/jquery/jquery-1.8.3.min.js https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js
curl -o ./templates/static/css/libs/css/normalize.css http://necolas.github.com/normalize.css/2.0.1/normalize.css

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
        No ) exit;;
    esac
done

# no need for this file anymore, eh?
echo "Cleaning up..."
rm ./$0

# blam
echo "Done!"
