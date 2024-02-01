#!/usr/bin/env bash
# exit on error
set -o errexit


# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
cp -r assets/static/ priv/static/
mix assets.deploy 

# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite
