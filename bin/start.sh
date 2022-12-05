#!/usr/bin/env bash

# exit on error
set -o errexit

# Use the correct version of Ruby
source $RENDER_SRC_ROOT/web/bin/env.sh

cd $RENDER_SRC_ROOT/web

bin/puma