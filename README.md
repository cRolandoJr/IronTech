# IronTech

Web y desarrollo del negocio de IronTech en Viedma y Carmen de Patagones.
Este repositorio es la fuente de trabajo desde el 8 de noviembre de 2026.

### Estado

- Web estática inicial importada con su historial Git.
- Entorno Nix y configuración local de Nginx.
- Contacto comercial: +54 9 2920 665437.
- Pendiente visual: reemplazar el afiche del encabezado por una muestra del servicio.
- Sin VPS contratado ni despliegue desde este repositorio al servidor propio.
- La copia anterior en Sites es privada; no se actualiza al editar estos archivos.

### Empezar

Requisitos: Nix con flakes habilitados, Linux x86_64 y Git.

```zsh
cd ~/projects/IronTech
nix develop -c zsh
make check
make serve
```

Abrí <http://127.0.0.1:8080>. Nginx queda en primer plano; detenelo con Ctrl+C.
No necesita sudo. Si el puerto está ocupado, identificá su proceso antes de actuar.

En otra terminal podés entrar al mismo entorno para hacer una consulta HTTP:

```zsh
cd ~/projects/IronTech
nix develop -c zsh
curl -I http://127.0.0.1:8080/
cat .run/access.log
```

Los cambios en HTML y CSS se ven al recargar el navegador. Si cambiás la
configuración de Nginx, ejecutá `make reload` mientras el servidor está activo.
Ese comando valida la configuración antes de pedir la recarga.

### Archivos y responsabilidades

| Archivo | Responsabilidad |
| --- | --- |
| `dist/` | Web editable: HTML, CSS e imágenes, sin compilación |
| `flake.nix` | Herramientas del entorno de desarrollo |
| `flake.lock` | Revisión exacta y hash de nixpkgs |
| `infra/nginx.conf` | Servidor HTTP local, puerto 8080 |
| `Makefile` | Comandos cortos para validar, servir y recargar |
| `docs/negocio.md` | Oferta, hipótesis y próximo experimento comercial |
| `docs/aprendizaje.md` | Primera práctica y siguientes hitos |
| `.openai/hosting.json` | Identidad conservada de la publicación previa en Sites |

El nombre `dist/` viene de la primera versión. Acá contiene los fuentes de la web,
no una salida generada. No hace falta Node, Flutter ni una base de datos.
La tipografía todavía se descarga de Google Fonts.

### Qué reproduce Nix

`nix develop` proporciona herramientas desde la revisión fijada en `flake.lock`.
El lock inicial reutiliza la revisión de nixpkgs de tu configuración local de
NixOS; no depende de una ruta privada de esta computadora.

Esto reproduce el entorno de herramientas para Linux x86_64. No configura todo
el sistema ni convierte el servidor en NixOS. La configuración actual escucha
solo en loopback y sirve HTTP: es un laboratorio, no una configuración productiva.

Para revisar los documentos:

El linter permite pasar del título a subtítulos `###`, siguiendo tu convención.

```zsh
make lint
```

### Despliegue posterior

Antes de preparar producción necesitamos proveedor, sistema operativo, acceso
SSH y dominio. Ahí definiremos servicio de arranque, HTTPS, firewall, entrega de
archivos y recuperación de una versión anterior. No uses la configuración local
como configuración pública del VPS.

No hay remoto GitHub configurado. El repositorio conserva el commit de la web
anterior y agrega una base local; publicar el código es una decisión posterior.
