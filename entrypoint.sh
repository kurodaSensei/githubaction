#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
  git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

# Exportar GITHUB_TOKEN desde las variables de entorno de GitHub Actions
export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

# Ejecutar el script de Node.js
node runThemeCheck.js

echo "Theme Check finalizado"
exit 0
