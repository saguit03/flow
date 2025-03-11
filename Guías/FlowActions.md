# Guía para Implementar Flujos de Trabajo con GitFlow en GitHub Actions

## 1. Introducción

Esta guía describe cómo implementar un flujo de trabajo en GitHub Actions basado en GitFlow. Simularemos Terraform con una imagen Docker, que se construirá y publicará en el GitHub Container Registry (GHCR) en cada release.

## 2. Configuración de GitFlow

GitFlow define ramas principales para organizar el desarrollo:
- **main**: Contiene el código estable y en producción.
- **develop**: Rama donde se integran nuevas funcionalidades antes de ser liberadas.
- **feature/**: Ramas para desarrollar nuevas características.
- **release/**: Ramas para preparar una nueva versión.
- **hotfix/**: Ramas para corregir errores en producción.

### Instalación de GitFlow
Si no tienes GitFlow instalado, puedes hacerlo con:
```sh
brew install git-flow-avh  # macOS
debian: sudo apt install git-flow  # Linux
```
Inicializa GitFlow en tu repositorio:
```sh
git flow init
```

## 3. Creación del Dockerfile

En el repositorio, crea un archivo `Dockerfile` con la siguiente configuración para simular Terraform:
```dockerfile
FROM alpine:latest
RUN apk add --no-cache terraform
CMD ["terraform", "--version"]
```

## 4. Configuración de GitHub Actions

Crea el directorio `.github/workflows/` y dentro un archivo `ci-cd.yml` con el siguiente contenido:

```yaml
name: CI/CD para Terraform Docker

on:
  push:
    branches:
      - main
      - develop
    tags:
      - 'v*'
  pull_request:
    branches:
      - main
      - develop

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout del código
        uses: actions/checkout@v4

      - name: Configurar QEMU
        uses: docker/setup-qemu-action@v3

      - name: Configurar Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login en GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Construir y etiquetar la imagen
        run: |
          docker build -t ghcr.io/${{ github.repository }}/terraform:latest .

      - name: Subir imagen a GHCR
        run: |
          docker push ghcr.io/${{ github.repository }}/terraform:latest
```

## 5. Uso del Flujo GitFlow

### Agregar una Nueva Funcionalidad
```sh
git flow feature start nueva-feature
git add .
git commit -m "Implementación de nueva feature"
git flow feature finish nueva-feature
git push origin develop
```

### Preparar una Release
```sh
git flow release start v1.0.0
git flow release finish v1.0.0
git push origin main --tags
git push origin develop
```
Esto activará el flujo de GitHub Actions y desplegará la imagen Docker en GHCR.

## 6. Conclusión

Siguiendo esta guía, hemos implementado un flujo de trabajo basado en GitFlow en GitHub Actions, automatizando la construcción y publicación de una imagen Docker que simula Terraform en GitHub Container Registry.

