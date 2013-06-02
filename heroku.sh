#    Heroku app creation script
#    (for Tornado on Heroku)
#  
#    Author: Mike Dory | dory.me
#    Created: 11.12.11 | Updated: 06.02.13
#    Contributions by Tedb0t, gregory80
#
# ------------------------------------------

# set up the Procfile
touch Procfile
echo 'web: python main.py --port=$PORT' >> Procfile

# specify a runtime
touch runtime.txt

# offering to create a virtualenv
echo "Do you want to run this on Python 3?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "python-3.3.2" >> runtime.txt
            break;;
        No )
            echo "python-2.7.4" >> runtime.txt
            break;;
    esac
done


# ------------------------------------------

echo "Committing to Git"

# Heroku runs on Git
git add .
git rm --cached heroku.sh
git rm --cached init.sh
git commit -am "Initial commit"

# ------------------------------------------

echo "Creating Heroku app & pushing"

# make a new app on the cedar stack (where the Python apps live)
heroku create --stack cedar
git push heroku master

# ------------------------------------------

echo "New project created! Taking you there now."

# let's go see the new app!
heroku open

# ------------------------------------------

# no need for this file anymore, eh?
echo "Cleaning up..."
rm ./$0

# blam
echo "Done!"
