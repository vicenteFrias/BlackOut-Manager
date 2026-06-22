BlackOut Manager 🎨📓

BlackOut Manager es un ecosistema digital independiente y distribuido diseñado para asistir a tatuadores, artistas y administradores en la organización integral de su práctica profesional y la gestión operativa de sus estudios. El sistema busca centralizar, automatizar y digitalizar procesos complejos que tradicionalmente se manejan de forma manual (como cuadernos físicos), tales como el agendamiento de citas, el control de la propiedad intelectual de diseños y la gestión de flujos financieros.

El software está construido bajo una arquitectura de microservicios distribuida, segura y escalable de alta disponibilidad, aliviando por completo la carga administrativa mediante la automatización de procesos clave.

👥 Integrantes

Vicente Frias

Tomas Morales

🚀 Funcionalidades y Estructura de Microservicios

El ecosistema divide estrictamente sus responsabilidades de negocio en bases de datos lógicas independientes por microservicio (Database per Service). El backend está compuesto por los siguientes 10 módulos independientes:

Módulo de Usuarios y Autenticación: Centraliza el registro de usuarios, la encriptación de contraseñas mediante el algoritmo de hash BCrypt y la emisión de credenciales digitales temporales (Tokens JWT) con roles específicos (ARTISTA, ADMINISTRADOR).

Módulo de Citas: Controla el flujo transaccional de agendamiento y reserva de sesiones de tatuaje asociando un cliente con un artista. Valida las reglas de negocio críticas, como evitar colisiones horarias.

Módulo de Agenda: Encargado de la persistencia de la disponibilidad de bloques de tiempo de los artistas y la visualización de las horas ocupadas o personales en el calendario del estudio.

Módulo de Ficha: Gestiona la información médica e histórica sensible del cliente antes de la sesión. Almacena los consentimientos informados firmados digitalmente, registros de alergias, enfermedades crónicas y observaciones médicas del procedimiento.

Módulo de Catálogo y Diseños: Portafolio digital de diseños artísticos disponibles en modalidad "Flash". Aplica la Regla de Exclusividad Flash: si un diseño es marcado como exclusivo, cambia automáticamente su atributo a no disponible tras su primer canje, bloqueando nuevas reservas.

Módulo de Pagos y Cartera: Centraliza el flujo de caja operativo del estudio. Al marcar una cita como pagada, procesa el ingreso monetario restando de manera automática los gastos de insumos registrados. Permite visualizar de forma inmediata la liquidez actual y el sueldo neto disponible del tatuador mediante una métrica de Saldo Rápido directamente en su Dashboard, evitando la navegación compleja por reportes financieros extensos.

Módulo de Productos: Inventario en tiempo real de insumos críticos del estudio (como tintas, agujas y guantes). Controla el stock actual, niveles mínimos de seguridad y registra cada movimiento de inventario (compra, uso en sesión, pérdida o ajuste).

Módulo de Fidelidad: Billetera virtual de puntos acumulados según el monto gastado por el cliente. Cuenta con Categorización Automática jerárquica (Bronce < 1000, Plata ≥ 1000, Oro ≥ 2000, VIP ≥ 5000 puntos) y bloquea intentos de fraude si se solicita un descuento mayor a los puntos acumulados en la cuenta.

Módulo de Calificaciones: Registro de feedback estricto (de 1 a 5 estrellas) y comentarios de clientes para calcular la reputación del artista, bloqueando el envío de segundas reseñas para una misma cita.

Módulo de Notificaciones: Componente perimetral que simula el envío automatizado y unidireccional de comprobantes de pago y alertas de confirmación al cliente para no afectar el rendimiento del núcleo (core) del sistema.

🚫 Fuera del Ámbito (Lo que NO hará el sistema)

El sistema no procesará transacciones bancarias directas ni integrará pasarelas de pago de terceros en su núcleo base.

No actuará como una plataforma de mensajería instantánea o chat interactivo bidireccional entre el cliente y el artista; las comunicaciones externas son netamente alertas unidireccionales automatizadas.

🛠️ Stack Tecnológico y Dependencias

Lenguaje de Programación: Java 21

Framework Principal: Spring Boot 3.x

Orquestador de Puerta de Enlace: Spring Cloud Gateway (API Gateway centralizado en el Puerto 8080 o 9090).

Gestión de Dependencias y Construcción: Maven

Base de Datos Relacional: MySQL (Patrón Database per Service con esquemas lógicos independientes como db_seguridad, db_fidelidad, etc., administrados con XAMPP).

Dependencias Principales (pom.xml)

Para que cada microservicio opere bajo un estándar de alta cohesión y bajo acoplamiento, se utilizan las siguientes librerías del ecosistema de Spring y Java:

Spring Boot Starter Web: Habilita la creación de la API REST tradicional, serialización y mapeo de controladores.

Spring Boot Starter WebFlux: Integra el cliente reactivo WebClient en lugar del obsoleto RestTemplate, permitiendo la comunicación interactiva síncrona/asíncrona inter-servicio de manera fluida y de alto rendimiento.

Spring Boot Starter Data JPA: Implementa Hibernate para mapear de manera automática las entidades del Modelo de Entidad-Relación (MER) y gestionar de forma limpia la persistencia transaccional.

Lombok: Reducción drástica del código repetitivo o boilerplate (Getters, Setters, constructores, constructores patrón Builder, etc.) a través de anotaciones en tiempo de compilación.

Spring Boot Starter Validation: Validación estricta en el servidor para asegurar la integridad de datos provenientes de los DTOs de entrada (ej: @NotNull, @Min(1), @Size, @Email).

MySQL Driver: Driver nativo JDBC que habilita las conexiones de red seguras hacia el motor local gestionado vía XAMPP.

Springdoc OpenAPI Starter WebMVC (Swagger UI): Genera automáticamente los contratos API interactivos de los endpoints de cada servicio para ser centralizados y probados desde el API Gateway.

Spring Security (con dependencias JWT): Empleado en el perímetro de seguridad (ms-auth y Gateway) para la emisión, cifrado con algoritmo HS256 y parseo stateless de tokens firmados.

Mockito & JUnit 5 (Spring Boot Starter Test): Suite indispensable para el diseño de pruebas unitarias robustas utilizando aislamiento simulado (mocks) mediante el patrón AAA.

🔄 Comunicación Inter-servicio

Para evitar silos de información, se implementa el componente reactivo WebClient (Spring WebFlux) para llamadas HTTP eficientes entre los microservicios core (por ejemplo, cuando el microservicio de Pagos le notifica directamente al de Fidelidad para sumar puntos tras una transacción) transaccionando mediante objetos DTO.

🛡️ Modelo de Seguridad (JWT + API Gateway)

El sistema implementa una Protección Stateless perimetral estricta basada en el estándar JSON Web Token (JWT - RFC 7519):

Generación: Al iniciar sesión con credenciales válidas en ms-auth, se valida la contraseña encriptada con BCrypt, se genera un Token JWT firmado digitalmente con el algoritmo HS256 (llave secreta jwt.secret), con una vigencia de 2 horas e incrustación de roles (ARTISTA, ADMINISTRADOR) mediante carga síncrona EAGER.

Validación: El API Gateway actúa como "Guardia" aplicando un filtro global de validación (AuthenticationFilter). Intercepta cualquier petición externa y verifica la autenticidad del token en la cabecera Authorization: Bearer <TOKEN>. Si no está presente o expiró, rechaza inmediatamente con un código HTTP 401.

🏗️ Patrón de Diseño y Robustez Código

Arquitectura en Capas: Cada microservicio está estructurado internamente en capas independientes para potenciar el desacoplamiento, facilitando las pruebas unitarias automatizadas y el mantenimiento aislado.

Simplicidad Operativa con DTOs: Las interfaces de entrada de los artistas están diseñadas para procesarse en un máximo de dos clics debido a su limitado tiempo durante las sesiones. La información cruda se filtra y valida mediante DTOs estructurados antes de alcanzar las capas de servicio.

Transaccionalidad Atómica: Las operaciones distribuidas complejas están protegidas bajo la anotación @Transactional de Spring, asegurando que si ocurre un fallo a mitad de camino, se aplique un rollback completo previniendo datos huérfanos o inconsistencias.

Manejo Global de Excepciones: Se implementa un GlobalExceptionHandler unificado para interceptar fallos de lógica de negocio y mapearlos a respuestas HTTP semánticas (ej: 400 Bad Request, 409 Conflict), ocultando por completo las trazas de código internas para proteger la seguridad del ecosistema.

🧪 Estrategia de Testing (Patrón AAA)

Para robustecer el software y mitigar riesgos antes del despliegue, se implementan Pruebas Unitarias a nivel de funciones y métodos específicos, aislando los elementos externos mediante técnicas de Mocking.

Todos los tests automatizados del ecosistema adoptan de manera estricta el Patrón AAA (Arrange, Act, Assert):

Arrange (Organizar / Preparar): Se configura el escenario, inicializando variables, instanciando objetos de prueba y preconfigurando los comportamientos simulados (mocks).

Act (Actuar / Ejecutar): Se ejecuta la acción o función real bajo evaluación (generalmente en una sola línea de código) capturando el resultado obtenido.

Assert (Afirmar / Verificar): Se verifica si el resultado arrojado coincide exactamente con el valor esperado. Si no se cumple, la prueba falla evidenciando el bug.

📖 Documentación Automatizada con Swagger

El proyecto cuenta con integración completa de Swagger / OpenAPI de forma híbrida: generación descentralizada del contrato por microservicio y visualización unificada en el Gateway.

1. Inclusión de la Dependencia Core (Incluida en cada microservicio)

<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
    <version>2.3.0</version>
</dependency>


2. Configuración expuesta en los entornos (application.yml / properties)

Cada microservicio publica su contrato JSON/YAML en una ruta específica indexada por el Gateway:

springdoc:
  api-docs:
    path: /api/v1/disenos/v3/api-docs


3. Agregación Centralizada

Para probar y visualizar las rutas sin navegar por múltiples pestañas, el API Gateway (Puerto 9090 o 8080) centraliza la documentación. Desde la interfaz gráfica de Swagger UI se puede seleccionar el microservicio que se desea evaluar a través del menú desplegable superior.

💻 Pasos para Ejecutar en Entornos Locales

Preparar las Bases de Datos:

Inicia los servicios de Apache y MySQL desde tu panel de XAMPP.

Ingresa a phpMyAdmin y crea los esquemas independientes requeridos por el ecosistema (db_seguridad, db_fidelidad, etc.).

Clonar el repositorio:

git clone [https://github.com/vicenteFrias/BlackOut-Manager.git](https://github.com/vicenteFrias/BlackOut-Manager.git)


Configuración de entornos de red:

Asegúrate de revisar y configurar el archivo application.properties o application.yml de cada microservicio con las credenciales y puertos correspondientes para asegurar la conexión de persistencia local.

Ejecución simultánea con Maven:

Puedes levantar cada microservicio de manera independiente ejecutando el siguiente comando en la raíz de su respectiva carpeta:

mvn spring-boot:run


Prueba de Endpoints:

Puedes consumir directamente la API ingresando a la URL unificada de Swagger UI en el navegador para transaccionar en tiempo real de forma gráfica.
URL SWAGGER: http://localhost:9090/swagger-ui.html 
