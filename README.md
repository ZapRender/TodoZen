# todo_zen

Tecnologias a usar:

Firebase cloud Firestore -> Donde se van a almacenar las tareas
Firebase cloud functions (firebase cloud triggers y libreria de node) -> Para traducir el texto ingresado a ingles.
Firebase auth -> Para la autenticacion de los usuarios

Para esta app decidí utilizar una arquitectura basada en Faeature-based y Clean Architecture, con el fin de tener un código más limpio y escalable.
lib/
│── core/
│   ├── services/        # Servicios generales (Firebase, API, etc.)
│   ├── utils/           # Utilidades y helpers
│   ├── bindings/        # Bindings de GetX
│   ├── theme/           # Configuración de temas
│── data/
│   ├── models/          # Modelos de datos
│   ├── repositories/    # Repositorios de datos (Firebase, local, etc.)
│── domain/
│   ├── use_cases/       # Casos de uso (lógica de negocio)
│── presentation/
│   ├── controllers/     # Controladores de GetX
│   ├── views/           # Pantallas y widgets
│   ├── widgets/         # Widgets reutilizables
│── routes/
│   ├── app_pages.dart   # Definición de rutas con GetX
│   ├── app_routes.dart  # Nombres de rutas
│── main.dart            # Punto de entrada de la app


Para el caso de mi app, por el momento solo voy a implementar el tema oscuro por defecto, pero se dejan preparados
los archivos para configurar el tema claro.

para la creacion y administracion de las ramas use git flow. Creando una rama main
una rama de develop, y una rama de feature para cada funcionalidad que se vaya a implementar.