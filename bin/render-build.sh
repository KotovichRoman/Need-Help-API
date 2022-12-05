#!/usr/bin/env bash

# exit on error
set -o errexit

# Use the correct version of Ruby
source $RENDER_SRC_ROOT/web/bin/env.sh

gem install bundler --silent
gem update --system --silent --no-document
bundle install

npm install --prefix $RENDER_SRC_ROOT/web
npm run build --prefix $RENDER_SRC_ROOT/web