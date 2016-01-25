#!/bin/sh
APP_NAME="${RAILS_APP_NAME:-test_app}"
HOME="/rails_app/$RAILS_APP_NAME"

cd /rails_app

startServer() {
  echo "[i] starting rails server"
  cd "$APP_NAME"
  bundle exec rails server -b 0.0.0.0
}

if [ -d "$APP_NAME" ];then
  startServer
else 
  echo "[i] creating rails skeleton [$APP_NAME]"
  rails new "$APP_NAME" --skip-bundle
  cp /Gemfile "$APP_NAME"/Gemfile
  startServer
fi


