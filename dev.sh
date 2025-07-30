#!/bin/bash

echo "🧹 Limpiando caché de Jekyll..."
rm -rf .jekyll-cache _site

echo "🔍 Comprobando dependencias..."
docker compose run --rm jekyll bundle check || {
  echo "📦 Instalando dependencias faltantes..."
  docker compose run --rm jekyll bundle install
}

echo "🚀 Arrancando servidor Jekyll en Docker..."
docker compose up -d
