# Todo Zen

## Descripción
Todo Zen es una aplicación de tareas desarrollada con **Flutter** y **GetX**, enfocada en ofrecer una experiencia fluida y eficiente. Se basa en principios de **Clean Architecture** y **Feature-Based Architecture**, lo que permite un código modular, escalable y fácil de mantener.

## Tecnologías utilizadas
- **Flutter**: Framework para la creación de la interfaz de usuario.
- **GetX**: Paquete para la gestión del estado, navegación e inyección de dependencias.
- **Firebase**:
  - **Cloud Firestore**: Almacenamiento de tareas.
  - **Cloud Functions**: Traducción automática de texto a inglés.
  - **Firebase Auth**: Autenticación de usuarios.
- **Git Flow**: Estrategia de control de versiones con ramas **main**, **develop** y **feature**.

## Estructura del Proyecto
El proyecto sigue una estructura basada en **Clean Architecture** y organización por features:

```
lib/
│── core/              # Componentes esenciales y reutilizables
│   ├── services/      # Servicios generales (Firebase, API, etc.)
│   ├── utils/         # Funciones auxiliares y helpers
│   ├── bindings/      # Bindings de GetX para inyección de dependencias
│   ├── theme/         # Configuración de temas (oscuro y claro)
│── data/              # Capa de datos
│   ├── models/        # Modelos de datos
│   ├── repositories/  # Repositorios de acceso a datos (Firebase, local, etc.)
│── domain/            # Capa de dominio
│   ├── use_cases/     # Lógica de negocio encapsulada en casos de uso
│── presentation/      # Capa de presentación
│   ├── controllers/   # Controladores de GetX
│   ├── views/         # Pantallas de la app
│   ├── widgets/       # Componentes reutilizables
│── routes/            # Configuración de rutas con GetX
│   ├── app_pages.dart # Definición de rutas
│   ├── app_routes.dart# Nombres de rutas
│── main.dart          # Punto de entrada de la app
```

## Gestión del Estado con GetX
### Conceptos clave de GetX implementados en la app:
1. **Controlador**: Intermediario entre la UI y la lógica de negocio. Maneja el estado y llama a los casos de uso según se necesite.
2. **Binding**: Inyecta dependencias en los controladores, asegurando que cada pantalla reciba las instancias adecuadas.
3. **Rutas**: Permiten la navegación sin `context`, definiéndolas en un solo archivo para usarlas en toda la app.
4. **Vista**: La UI de la app, donde se usa `Obx()` para reaccionar a cambios de estado en los controladores.

## Temas
Actualmente, la aplicación está configurada para utilizar **tema oscuro por defecto**, pero la estructura está lista para agregar un modo claro en el futuro.

## Gestión de Versionado con Git Flow
Se ha seguido la estrategia de **Git Flow**:
- **`main`**: Contiene las versiones estables en producción.
- **`develop`**: Rama principal de desarrollo.
- **`feature/*`**: Ramas creadas para cada nueva funcionalidad.

## Instalación y Ejecución
1. Clona el repositorio:
   ```bash
   git clone https://github.com/ZapRender/TodoZen.git
   cd todo_zen
   ```
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Configura Firebase:
   - Descarga el archivo `google-services.json` (Android) o `GoogleService-Info.plist` (iOS) desde Firebase y colócalo en su respectiva carpeta `android/app` o `ios/Runner`.
4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Próximas Mejoras
- Implementación del modo claro.
- Integración de pruebas unitarias y de UI.
- Soporte para múltiples idiomas.

---
**Autor:** Alejandro Zamudio   
**Repositorio:** [GitHub](https://github.com/ZapRender/TodoZen)

