#!/bin/sh
set -e

curl -f -o .static/buildPreload.js https://slate-prover.org/download/static/buildPreload.js
curl -f -o .static/buildStatic.js https://slate-prover.org/download/static/buildStatic.js
curl -f -o .static/template.ejs https://slate-prover.org/download/static/template.ejs
curl -f -o .static/templates.slate https://slate-prover.org/data/notation/templates.slate

node .static/buildPreload.js Library.slate .static/dist/preload
node .static/buildStatic.js Library.slate hlm .static/template.ejs .static/templates.slate .static/dist/static
