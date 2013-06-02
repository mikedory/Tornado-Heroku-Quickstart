#    Project creation script
#    (for Tornado on Heroku)
#  
#    Author: Mike Dory | dory.me
#    Created: 11.12.11 | Updated: 06.02.13
#    Contributions by Tedb0t, gregory80
#
# ------------------------------------------

echo "************************************"

# create directories (just in case they need creatin')
mkdir -p templates
mkdir -p static static/img static/css static/js

# setup the libs dirs
echo "Creating directories and fetching dependancies"
mkdir -p ./static/js/libs/jquery ./static/css/libs/normalize

# fetch yer dependancies
curl -o ./static/js/libs/jquery/jquery-1.10.1.min.js https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js
curl -o ./static/css/libs/normalize/normalize.css http://necolas.github.com/normalize.css/2.1.2/normalize.css

# ------------------------------------------

# git!
git init

# ------------------------------------------

# set up the basics
touch README.mdown

# ------------------------------------------

# offering to create a virtualenv
echo "Do you want a virtualenv?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            virtualenv venv --distribute
            source ./venv/bin/activate
            pip install -r requirements.txt
            break;;
        No ) 
            echo "Cool. You can run \`pip install tornado\` to get the latest."
            break;;
    esac
done

# make a new Heroku app (or don't)
echo "Do you want to start a Heroku app as well?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            ./heroku.sh;
            break;;
        No ) 
            echo "No worries, you can do that later via the heroku.sh file"
            break;;
    esac
done

# no need for this file anymore, eh?
echo "Wrapping up..."
rm ./$0

# blam. 'tis done.
echo "Done!"
echo "************************************"
