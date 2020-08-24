#!/bin/sh
set -e

if [ "$1" = "--local" ]; then
  cp ../../../dist/public/download/static/* .static/
  cp ../../notation/templates.slate .static/
else
  curl -f -o .static/buildPreload.js https://slate-prover.org/download/static/buildPreload.js
  curl -f -o .static/buildStatic.js https://slate-prover.org/download/static/buildStatic.js
  curl -f -o .static/template.ejs https://slate-prover.org/download/static/template.ejs
  curl -f -o .static/templates.slate https://slate-prover.org/data/notation/templates.slate
fi

node .static/buildPreload.js Library.slate .static/dist/preload
node .static/buildStatic.js Library.slate hlm .static/template.ejs .static/templates.slate libraries/hlm https://github.com/SReichelt/slate-hlm/blob/master/ .static/dist/static
