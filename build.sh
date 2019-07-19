#!/usr/bin/env bash
# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

# Remove the existing release directory and build the release
rm -rf _build
MIX_ENV=prod mix release
