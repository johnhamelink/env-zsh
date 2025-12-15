# When the current working directory changes, run a method that checks for a .env file, then sources it. Happy days.

autoload -U add-zsh-hook
load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f .env && -r .env ]]; then
       source .env
     fi
     # additional env option to prevent conflicts between main Docker `.env` applications and terminal
     if [[ -f .env.term && -r .env.term ]]; then
       source .env.term
     fi
}

load-local-conf
add-zsh-hook chpwd load-local-conf
