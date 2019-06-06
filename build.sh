#!/usr/bin/env bash
export MIX_ENV=prod

# Get app name and version from mix.exs
export APP_NAME="$(grep 'app:' mix.exs | sed -e 's/\[//g' -e 's/ //g' -e 's/app://' -e 's/[:,]//g')"
export APP_VSN="$(grep 'version:' mix.exs | cut -d '"' -f2)"

# Remove existing builds
rm -rf "_build"

# Compile app and assets
mix deps.get --only prod
mix compile
cd assets && npm install && npm run deploy && cd ..

# Create release
# we don't need to create a tarball because the app will be
# served directly from the build directory
mix do phx.digest, release --env=prod --no-tar

echo "Linking release $APP_NAME:$APP_VSN to _render/"

ln -sf "_build/$MIX_ENV/rel/$APP_NAME" _render
