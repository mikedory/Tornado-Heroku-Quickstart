# git stuff
mkdir $1
cd $1
git init
touch README.mdown
git add README.mdow
git commit -m 'first commit!'
git remote add origin git@github.com:mikedory/$1.git
git push -u origin master