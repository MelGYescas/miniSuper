# MiniSuper

Este proyecto es una aplicación web desarrollada con Django para gestionar un mini supermercado virtual.

## Requisitos

Asegúrate de tener Python instalado en tu sistema. Puedes descargarlo desde [python.org](https://www.python.org/downloads/) o instalarlo utilizando tu gestor de paquetes preferido.

## Configuración del Entorno Virtual

1. Crea un ambiente virtual para el proyecto. Abre tu terminal y navega hasta la carpeta del proyecto:

   ```bash
   cd /ruta/a/tu/proyecto/MiniSuper
   python -m venv venv
   ```

2. Activa el ambiente virtual:

   Para sistemas Unix/Linux/macOS:
   ```bash
   source venv/bin/activate
   ```

   Para Windows (cmd.exe):
   ```bash
   venv\Scripts\activate
   ```

3. Instala Django utilizando `pip`:

   ```bash
   pip install -r requirements.txt
   ```

## Ejecución del Proyecto

1. Asegúrate de estar en el directorio raíz del proyecto y de que el ambiente virtual esté activado.

2. Ejecuta las migraciones de la base de datos:

   ```bash
   python manage.py migrate
   ```

3. Inicia el servidor de desarrollo:

   ```bash
   python manage.py runserver
   ```

   El proyecto estará disponible en `http://localhost:8000/gestion/` en tu navegador web.
   
## Video Demostrativo

[![Ver Video Demo](https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/YouTube_social_white_square_%282017%29.svg/40px-YouTube_social_white_square_%282017%29.svg.png)](https://youtu.be/397rqOvtFlk)

Puedes ver una demostración de este proyecto con los datos cargados que tu me diste [aquí](https://youtu.be/397rqOvtFlk).

