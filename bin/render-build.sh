set -o errexit

export RUBY_VERSION=$(cat $RENDER_SRC_ROOT/web/.ruby-version)
export BUNDLE_GEMFILE=$RENDER_SRC_ROOT/web/Gemfile
set_ruby_env $(fetch_or_build "$RUBY_VERSION")
gem install bundler
gem update --system

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate