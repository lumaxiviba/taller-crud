# Sistema de Gestión de Vehículos - Xtreme Performance 🚗🔧

## 💻 Tecnologías Utilizadas

**Frontend:**

- Angular (TypeScript)
- HTML5 / CSS3
- Bootstrap (Diseño responsivo y ventanas modales)

**Backend:**

- C# .NET Core (Web API)
- Entity Framework Core
- Arquitectura en N-Capas

**Base de Datos:**

- MySQL

## ✨ Características Principales

- **Gestión de Vehículos:** CRUD completo (Crear, Leer, Actualizar, Eliminar) para el registro estructurado de autos.
- **Búsqueda Avanzada:** Filtrado de datos en tiempo real mediante parámetros de _Placa_ y _Modelo_ en el cliente.
- **Interfaz Dinámica:** Uso de componentes modales para la inserción y edición de registros, evitando recargas innecesarias de página.
- **Integración Relacional:** Asignación de marcas de vehículos gestionadas directamente desde catálogos en la base de datos.

## 🚀 Instalación y Ejecución

### Requisitos Previos

- Node.js y Angular CLI instalados.
- .NET SDK.
- Servidor MySQL activo.

### Configuración del Backend (.NET API)

1. Abrir la solución en Visual Studio 2022.
2. Navegar al archivo `appsettings.json` dentro del proyecto principal (`01 API`) y verificar que la cadena de conexión (`ConnectionString`) apunte correctamente a la base de datos MySQL.
3. Ejecutar el proyecto (F5 o botón de Depurar). La API se levantará escuchando peticiones en puertos locales (ej. `https://localhost:7000`).

### Configuración del Frontend (Angular)

1. Abrir la terminal en la carpeta raíz del proyecto Angular utilizando Visual Studio Code.
2. Instalar las dependencias necesarias ejecutando:
   ```bash
   npm install
   ```
3. Levantar el servidor de desarrollo ejecutando:
   ```bash
   ng serve -o
   ```
4. El navegador se abrirá automáticamente en `http://localhost:4200/`.

## 📂 Estructura del Proyecto Backend

La solución .NET está dividida de forma modular para garantizar un bajo acoplamiento:

- **01 API:** Controladores RESTful y configuración de inyección de dependencias.
- **02 Bussnies:** Reglas e interfaces de la lógica de negocio.
- **03 Repository:** Acceso directo a datos e implementación de Entity Framework.
- **DbModel / DtoModel:** Modelos de base de datos y objetos de transferencia de datos.
