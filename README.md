# todo_zen


Para el desarrollo de esta aplicación decidí utilizar el paquete GetX, ya que es un paquete muy completo y fácil de usar, 
que me permite tener un control total sobre el estado de la aplicación, la navegación, la inyección de dependencias, entre otras cosas.

Resumen de getx:

    1. controlador: Es el intermediario entre la UI y la logica de negocio. Se encarga de manejar el estado de la aplicacion y llamar a los casos de uso cuando se necesiten.
    2. Binding: Es una clase que se encarga de inyectar las dependencias en el controlador. Es decir, se encarga de que cada pantalla 
    obtenga las instancias correctas del controlador y sus dependencias.
    3. Rutas: Las rutas de getx permiten la navegacion sin la necesidad de context. Se definen en un solo archivo y se usan en toda la app.
    4. Vista: Es la Ui de la app. Se utiliza el obs() para escuchar los cambios de estado del controlador. 

Modelo de datos 
Clase repositorio -> maneja el acceso a los datos 
Caso de uso -> encapsula toda la logica de negocio de la aplicacion
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