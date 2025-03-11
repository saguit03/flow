# Introducción a GitFlow

GitFlow es un conjunto de extensiones para git que facilita el desarrollo basado en ramas (*trunk based development*).  

El desarrollo basado en ramas consiste en separar las distintas fases del desarrollo:

- Producción en la rama principal (`master` o `main`).
- Desarrollo en `develop`.
  - Cada característica nueva se desarrolla en `feature/`.
- Lanzamiento de versiones en `release/`
- Revisiones en `hotfix/`

## Resumen de comandos básicos

```bash
git flow init
git flow feature start MYFEATURE
git flow feature finish MYFEATURE
git flow release start MYRELEASE
git flow release finish MYRELEASE
git flow hotfix start MYVERSION
git flow hotfix finish MYVERSION
```
Se recomienda consultar esta [Cheatseet](https://danielkummer.github.io/git-flow-cheatsheet/#commands).  

## Inicializar GitFlow en un repositorio
Dentro del repositorio, se debe iniciar GitFlow con el siguiente comando:

```bash
git flow init
```

Se realizarán una serie de cuestiones para customizar el flujo, o bien se pueden dejar por defecto (pulsando *enter* tras cada pregunta):

```
Which branch should be used for bringing forth production releases?
   - master
Branch name for production releases: [master]
Branch name for "next release" development: [develop]

How to name your supporting branch prefixes?
Feature branches? [feature/]
Bugfix branches? [bugfix/]
Release branches? [release/]
Hotfix branches? [hotfix/]
Support branches? [support/]
Version tag prefix? []
Hooks and filters directory? [repositorio/.git/hooks]
```

## Flujo de una *feature*

### Comenzar una característica

Una característica se inicia con el siguiente comando:  

```bash
git flow feature start MYFEATURE
```

Si todo ha ido bien, se mostrará el siguiente mensaje:  

```
Switched to a new branch 'feature/MYFEATURE'

Summary of actions:
- A new branch 'feature/MYFEATURE' was created, based on 'develop'
- You are now on branch 'feature/MYFEATURE'

Now, start committing on your feature. When done, use:

     git flow feature finish MYFEATURE
```

Una vez iniciada la característica, se podrá trabajar en ella. Al finalizar, se debe hacer *commit* de los cambios.

### Publicar una característica

Si la característica se está realizando en colaboración con otros, se puede publicar la rama al servidor remoto (ej. GitHub) para que otros usuarios puedan utilizarla.

```bash
git flow feature publish MYFEATURE
```

### Obtener una característica publicada

```bash
git flow feature pull origin MYFEATURE
```

También se puede seguir una característica publicada.

```bash
git flow feature track MYFEATURE
```

### Finalizar una característica

```bash
git flow feature finish MYFEATURE
```

Al terminar una característica utilizando *git flow*, automáticamente se actualizará la rama de *develop*, se eliminará la rama de la característica y se cambiará a la rama *develop*.

```
Switched to branch 'develop'
Updating 79374ba..5660ab4
Fast-forward
 ec2.tf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 ec2.tf
Deleted branch feature/MYFEATURE (was 5660ab4).

Summary of actions:
- The feature branch 'feature/MYFEATURE' was merged into 'develop'
- Feature branch 'feature/MYFEATURE' has been locally deleted
- You are now on branch 'develop'
```

## Flujo de una publicación

### Comenzar una publicación

```bash
git flow release start MYRELEASE
```

```
Switched to a new branch 'release/MYRELEASE'

Summary of actions:
- A new branch 'release/MYRELEASE' was created, based on 'develop'
- You are now on branch 'release/MYRELEASE'

Follow-up actions:
- Bump the version number now!
- Start committing last-minute fixes in preparing your release
- When done, run:

     git flow release finish 'MYRELEASE'
```

Es necesario publicar la rama al repositorio remoto:

```bash
git flow release publish MYRELEASE
```

```
Summary of actions:
- The remote branch 'release/MYRELEASE' was created or updated
- The local branch 'release/MYRELEASE' was configured to track the remote branch
- You are now on branch 'release/MYRELEASE'
```

Para seguir los cambios de la publicación remota:  

```bash
git flow release track MYRELEASE
```

### Cerrar una publicación

Al cerrar una publicación, los cambios se llevan a la rama principal.

```bash
git flow release finish MYRELEASE
```
## Flujo una revisión

### Comenzar una versión

```bash
git flow hotfix start MYVERSION
```

```
Switched to a new branch 'hotfix/MYVERSION'

Summary of actions:
- A new branch 'hotfix/MYVERSION' was created, based on 'master'
- You are now on branch 'hotfix/MYVERSION'

Follow-up actions:
- Start committing your hot fixes
- Bump the version number now!
- When done, run:

     git flow hotfix finish 'MYVERSION'
```

### Cerrar una revisión

Después de haber realizado *push* a la rama de la revisión, se puede cerrar para llevar los cambios a la rama principal.

```bash
git flow hotfix finish MYVERSION
```
