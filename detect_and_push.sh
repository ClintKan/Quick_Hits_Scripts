# A Program that detects new files / changes in a folder
# And then pushes those changes to an online gihub repo

#checking if there's been any changes in a folder; new files or updates

echo " "
echo "Welcome to this quick script to help you push your files to GitHub"

echo " "

echo "Make sure you are running within the folder that you intend to push to GitHub"
echo " "

push_fn () {
      echo " "

      echo "Enter your commit message below"
      read commit_context

      echo " "

      git commit -am "$commit_context"
           
      echo " "

      echo "Enter the URL link where you intend on pushing this to"
      read repo_link
     
      echo " "

      git remote add origin "$repo_link"

      echo " "

      git push -u origin main
      
      echo " "
}

if [[ -n $(git status --porcelain) ]]; then
  echo "There's been changes within this folder"

    if [ -d .git ]; then
            echo " "
      
      echo "Git is already initialized."

      push_fn

    else
      echo " "

      echo "Git is yet to be initialized in this folder."
      echo "Initializing now"
      git init
      echo " "
 
      git add ./

      push_fn

    fi

else
  echo "No new files detected. No changes to push."
fi
