#! /usr/local/bin/fish
# Usage:
# _deploy.sh $arg
# $arg can be blank or `remote` which deploys the site 

function build_site
  bundle exec jekyll build
  
  htmlcompressor -r -o _site _site

  find _site -type f -name '*.html' -exec gzip -9k '{}' \;
  find _site -type f -name '*.css' -exec gzip -9k '{}' \;
  find _site -type f -name '*.js' -exec gzip -9k '{}' \;
  find _site -type f -name '*.svg' -exec gzip -9k '{}' \;
end

# Main

set currentBranch (git rev-parse --abbrev-ref HEAD)

if not test $currentBranch = "master"
    printf "\033[31mNot on master branch. Aborting.\033[0m\n"
    exit 1
end

switch (echo $argv[1])
  case "local"
    build_site
  case "remote"
    build_site
    rsync -avz --delete-after _site/ alex@stormageddon:/var/www/geographyas.info/_site/
  case '*'
    printf "\033[31mUnknown argument. Use either `local` or `remote`.\033[0m\n"
end
