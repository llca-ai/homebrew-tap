#!/bin/sh
# Points the formula at a new llca release: sh update.sh 0.7.6
# Run it once the release tag is public (GitHub serves the archive only then).
set -eu
VERSION="${1:?usage: sh update.sh VERSION}"
URL="https://github.com/llca-ai/llca/archive/refs/tags/v$VERSION.tar.gz"
SHA=$(curl -fsSL "$URL" | shasum -a 256 | cut -d' ' -f1)
sed -i '' -e "s|^  url \".*\"|  url \"$URL\"|" -e "s|^  sha256 \".*\"|  sha256 \"$SHA\"|" Formula/llca.rb
echo "llca $VERSION  sha256 $SHA"
