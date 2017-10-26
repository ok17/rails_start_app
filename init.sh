#!/usr/bin/env bash


PROJECT="init_project"

echo "Set your project name [default: init_project]:"
read input

if [ -n "$input" ]; then
    PROJECT=$input
fi

#git clone

docker-sync start
docker-compose build app
docker-compose run --rm app bundle install

# Change parameters as you like
# To make api specification, give --api
docker-compose run --rm app rails new . --force --database=mysql --skip-git --skip-test

# Synchronize with the host side locally
docker-sync sync

cat <<EOF >> Gemfile
group :development, :staging, :test do
  gem 'ruby-debug-ide'
  gem 'debase'
end
EOF

docker-compose run --rm app bundle install

cp .docker/template/database.yml config/


# [db:create] does not have to be executed because it was generated at the time of [docker-compose run] execution
#docker-compose run --rm app db:create
docker-compse run --rm rails app db:migrae

# git init
if [ -d ./.git ]; then
    rm -fr .git
fi
git init
cp .docker/.gitignore .

echo "finished!!"
echo "please start command [docker-compose up] "
