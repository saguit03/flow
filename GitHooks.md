# Git Hooks

Los *Git hooks* son scripts que se ejecutan en determinados momentos del flujo de trabajo en Git. Pueden ayudar a automatizar tareas o aplicar políticas antes o después de ciertos eventos. A continuación se describen las funciones de algunos de los *git hooks* más utilizados.

- `applypatch-msg`. Validación o modificación de los mensajes de los parches.
- `commit-msg`. Validación o modificación del formato del mensaje del commit.
- `fsmonitor-watchman`. Mejora del rendimiento del sistema de archivos al integrar *watchman*.
- `post-update`. Notificación a otros sistemas después de un push.
- `pre-applypatch`. Validación de los parches antes de su aplicación.
- `pre-commit`. Validación o formateo de código antes de hacer commit.
- `pre-merge-commit`. Validación o realización de tareas antes de la fusión de ramas.
- `prepare-commit-msg`. Modificación automática de los mensajes de commit.
- `pre-push`. Ejecución de pruebas o validaciones antes de un push.
- `pre-rebase`. Validación del rebase antes de su ejecución.
- `pre-receive`. Validaciones previas a la recepción de un push.
- `push-to-checkout`. Automatización de la conmutación de ramas después de un push.
- `sendemail-validate`. Validación del correo electrónico antes de enviarlo.
- `update`. Validaciones antes de actualizar las referencias en el repositorio remoto.

---

## applypatch-msg
Este hook se ejecuta después de que se haya generado un mensaje de parche (`git apply`). Permite modificar el mensaje de parche antes de que sea utilizado para aplicar el parche.

**Ubicación:** `.git/hooks/applypatch-msg`

**Uso común:** Validación o modificación de los mensajes de los parches.

---

## commit-msg
Este hook se ejecuta cuando se está creando un commit, antes de que se registre el mensaje de commit. Se utiliza para validar el mensaje del commit, asegurándose de que cumpla con ciertos estándares, como formato o longitud.

**Ubicación:** `.git/hooks/commit-msg`

**Uso común:** Validación o modificación del formato del mensaje del commit.

---

## fsmonitor-watchman
Este hook se usa cuando se tiene configurado *fsmonitor* en Git para optimizar las operaciones de seguimiento de archivos. Se utiliza para ejecutar *watchman*, que realiza un seguimiento de los cambios en el sistema de archivos.

**Ubicación:** `.git/hooks/fsmonitor-watchman`

**Uso común:** Mejora del rendimiento del sistema de archivos al integrar *watchman*.

---

## post-update
Este hook se ejecuta después de que una referencia en el repositorio remoto ha sido actualizada, por ejemplo, después de un `git push`. Es comúnmente utilizado para notificar a otros servicios o desencadenar scripts.

**Ubicación:** `.git/hooks/post-update`

**Uso común:** Notificación a otros sistemas después de un push.

---

## pre-applypatch
Este hook se ejecuta antes de aplicar un parche usando `git am`. Se utiliza para validar o modificar el parche antes de su aplicación.

**Ubicación:** `.git/hooks/pre-applypatch`

**Uso común:** Validación de los parches antes de su aplicación.

---

## pre-commit
Este hook se ejecuta antes de que se registre un commit. Permite realizar tareas de validación, como comprobar el estilo de código o hacer pruebas unitarias, para evitar que se haga un commit con código que no cumple con las reglas preestablecidas.

**Ubicación:** `.git/hooks/pre-commit`

**Uso común:** Validación o formateo de código antes de hacer commit.

---

## pre-merge-commit
Este hook se ejecuta antes de realizar un commit de una fusión (merge). Permite realizar validaciones o ajustes antes de completar la fusión.

**Ubicación:** `.git/hooks/pre-merge-commit`

**Uso común:** Validación o realización de tareas antes de la fusión de ramas.

---

## prepare-commit-msg
Este hook se ejecuta antes de mostrar el mensaje de commit. Es útil para modificar el mensaje de commit antes de que el usuario lo edite, como añadir un prefijo o información adicional relacionada con el cambio.

**Ubicación:** `.git/hooks/prepare-commit-msg`

**Uso común:** Modificación automática de los mensajes de commit.

---

## pre-push
Este hook se ejecuta antes de enviar datos a un repositorio remoto (por ejemplo, antes de hacer un `git push`). Permite realizar validaciones previas, como pruebas automatizadas, para evitar que se empujen cambios incorrectos al repositorio.

**Ubicación:** `.git/hooks/pre-push`

**Uso común:** Ejecución de pruebas o validaciones antes de un push.

---

## pre-rebase
Este hook se ejecuta antes de iniciar un proceso de rebase. Se utiliza para validar o realizar ajustes antes de que la rebase comience, por ejemplo, para evitar conflictos de fusión.

**Ubicación:** `.git/hooks/pre-rebase`

**Uso común:** Validación del rebase antes de su ejecución.

---

## pre-receive
Este hook se ejecuta en el servidor antes de aceptar un `git push`. Permite realizar validaciones de seguridad o políticas de código antes de que los cambios sean aceptados en el repositorio remoto.

**Ubicación:** `.git/hooks/pre-receive`

**Uso común:** Validaciones previas a la recepción de un push.

---

## push-to-checkout
Este hook se ejecuta después de un `git push`, pero solo en algunos casos especiales. Es útil cuando se está usando la característica `push-to-checkout` para cambiar automáticamente el repositorio de trabajo después de un push.

**Ubicación:** `.git/hooks/push-to-checkout`

**Uso común:** Automatización de la conmutación de ramas después de un push.

---

## sendemail-validate
Este hook se ejecuta al enviar un correo electrónico para la revisión de un commit, permitiendo que el mensaje de correo sea validado antes de enviarlo.

**Ubicación:** `.git/hooks/sendemail-validate`

**Uso común:** Validación del correo electrónico antes de enviarlo.

---

## update
Este hook se ejecuta en el servidor cuando se recibe un `git push` y antes de que se actualice la referencia. Permite realizar verificaciones, como la comprobación de las ramas que se están actualizando.

**Ubicación:** `.git/hooks/update`

**Uso común:** Validaciones antes de actualizar las referencias en el repositorio remoto.

