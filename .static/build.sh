#!/bin/sh
set -e
#curl -o .static/buildPreload.js https://slate-prover.org/download/static/buildPreload.js
node .static/buildPreload.js Library.slate .static/dist/preload
