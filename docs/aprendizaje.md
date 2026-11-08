# Aprender DevOps con IronTech

### Forma de trabajo

Cada hito termina con algo funcionando que puedas explicar y repetir.
Vos tomás las decisiones y practicás la operación; la IA ayuda a preparar,
explicar y revisar. No se agregan servicios para llenar un temario.

### Hito 1: entender una petición HTTP

Objetivo: servir la web con Nginx local y ver el recorrido de una solicitud.

1. Entrá con `nix develop -c zsh` desde la raíz del repositorio.
2. Leé `infra/nginx.conf`: ubicá `listen`, `root`, `index` y `try_files`.
3. Ejecutá `make check`; debe terminar con `test is successful`.
4. Ejecutá `make serve` y abrí <http://127.0.0.1:8080>.
5. Desde otra terminal, consultá el HTML y el CSS con estos comandos.

   ```zsh
   curl -I http://127.0.0.1:8080/
   curl -I http://127.0.0.1:8080/style.css
   curl -I http://127.0.0.1:8080/no-existe
   ```

   Esperado: 200 para HTML y CSS, 404 para la ruta inexistente. Revisá también
   `Content-Type`: `text/html` y `text/css`. Un 200 no prueba que recibiste el archivo
   correcto; el contenido y las cabeceras completan la evidencia.

6. Leé `.run/access.log` y encontrá esas tres solicitudes.
7. Cambiá una frase en `dist/index.html` y recargá el navegador.
8. Revisá `git diff` para identificar exactamente lo que cambiaste.
9. Detené Nginx con Ctrl+C.

Pregunta para cerrar: ¿por qué editar HTML no requiere reiniciar Nginx,
pero cambiar el puerto sí requiere recargar su configuración?

### Conceptos que estás practicando

- Entorno declarativo: describir herramientas en vez de instalarlas a mano.
- Pinning: fijar una revisión mediante el lock, en vez de depender de lo último.
- HTTP: entender solicitudes, códigos de respuesta y tipos de contenido.
- Observabilidad: comprobar qué pasó leyendo el registro de acceso.
- Loopback: `127.0.0.1` limita el acceso a esta computadora.
- Control de versiones: revisar cambios y poder volver a un estado conocido.

### Hitos siguientes, todavía pendientes

| Hito | Entrega concreta | Qué aprendés |
| --- | --- | --- |
| 2. Corregir la web | Encabezado que muestre el servicio | Diseño y accesibilidad |
| 3. Elegir y preparar VPS | Acceso SSH y recuperación comprobados | Linux y operación |
| 4. Publicar con dominio | Web accesible por HTTPS | DNS, TLS y Nginx |
| 5. Repetir despliegues | Actualizar y volver a una versión anterior | Releases y rollback |
| 6. Automatizar lo repetido | Validación antes de desplegar | CI/CD |
| 7. Primer trabajo pago | Entrega con horas y costos registrados | Viabilidad del negocio |

NixOS se evalúa antes de instalar el VPS, según la compatibilidad y el método de
recuperación disponibles. Backend, base de datos y Flutter entran cuando exista
una función concreta que los necesite.

### Fuentes para estudiar

- [Entornos declarativos en Nix](https://nix.dev/tutorials/first-steps/declarative-shell.html).
- [Guía inicial de Nginx](https://nginx.org/en/docs/beginners_guide.html).

La guía de Nix introduce `shell.nix`; este repositorio expresa el entorno mediante
una flake. Compartimos el concepto de declarar herramientas, no todos los comandos.
