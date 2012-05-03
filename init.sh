# Project creation script
# (for Tornado on Heroku)
#
# by Mike Dory | dory.me
# 11.12.11
# updated by Tedb0t | tedbot.com

# --------------------------

# git!
git init

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

echo "Committing to Git"

# Heroku runs on Git
git add .
git commit -m "Initial Commit"

# --------------------------

echo "Creating Heroku app & pushing"

# make a new app on the cedar stack (where the Python apps live)
heroku create --stack cedar
git push heroku master

# --------------------------

echo "New project created! Taking you there now."

# let's go see the new app!
heroku open

# --------------------------

# no need for this file anymore, eh?

echo "Cleaning up..."

rm ./$0

echo "Done!"
