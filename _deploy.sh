#! /usr/bin/env fish
#
# Version 2.0, Usage:
# _deploy.sh $arg
# $arg can be `local` or `remote` which deploys the site
# MIT License

if not test $argv[1] = "local" -o $argv[1] = "remote"
  printf "USAGE: _deploy.sh [LOCAL/REMOTE]\n"
  exit 1
end

# Production environment flag for jekyll-assets
set -x JEKYLL_ENV "production"

printf "Building site...\n"
bundle exec jekyll build --quiet

# Compress build directory
printf "Minimising HTML files...\n"
htmlcompressor -r -o "./_site" "./_site"
printf "Compressing HTML and SVG files...\n"
find "./_site" -type f -name '*.html' -o -name '*.svg' -exec gzip -9k '{}' \;

# Update site permissions
printf "Fixing site permissions...\n"
chmod -R 755 "_site/"

if test $argv[1] = "remote"
  printf "Pushing to server...\n"
  rsync -avzq --delete-after "./_site/" alex@archer:"/usr/local/www/geographyas.info/"
end
