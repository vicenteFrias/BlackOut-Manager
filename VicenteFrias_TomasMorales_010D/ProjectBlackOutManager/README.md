BlackOut Manager 🎨📓

BlackOut Manager es una solución integral diseñada para tatuadores y artistas que buscan profesionalizar la gestión de su estudio. El sistema centraliza la administración de citas, el control financiero y el seguimiento de inventario en una plataforma robusta y eficiente.  

👥 Integrantes

Vicente Frias   
Tomas Morales   

🚀 Funcionalidades Principales
Basado en los requisitos y el desarrollo actual del sistema:

Módulo de Cartera (Nuevo): Permite visualizar de forma rápida el saldo total disponible del tatuador. Centraliza el cálculo del sueldo neto tras descontar automáticamente los gastos operativos, evitando tener que navegar por todo el módulo de finanzas para conocer la liquidez actual.

Módulo de Agenda: Gestión completa de citas (creación, modificación, eliminación) con visualización en calendario para organizar las sesiones de tatuaje y horas personales.  

Gestión de Usuarios: Registro detallado de pacientes, incluyendo datos de contacto.  

Gestión Financiera: Registro independiente de ingresos por proyectos y control de gastos en materiales o inversión.  

Control de Productos: Inventario en tiempo real de insumos críticos como tintas, agujas y guantes, con métricas sobre los productos más utilizados.  

🛠️ Stack Tecnológico

Lenguaje: Java 21   

Framework: Spring Boot   

Gestor de Dependencias: Maven

Base de Datos: MySQL (gestionada vía XAMPP)

Dependencias principales:

Lombok: Para la reducción de código repetitivo (Boilerplate).

Spring Data JPA: Para la persistencia y mapeo de datos.

Validation: Para asegurar la integridad de los datos ingresados.  

Spring Web / Reactive Web: Para la creación de la API REST.  

MySQL Driver: Para la conexión con el motor de base de datos.

💻 Pasos para Ejecutar
Para levantar el proyecto localmente, sigue estas instrucciones:

Preparar la Base de Datos:

Abre XAMPP e inicia los módulos de Apache y MySQL.

Accede a phpMyAdmin y crea la base de datos correspondiente al proyecto.

Clonar el repositorio:

Bash
git clone https://github.com/vicenteFrias/BlackOut-Manager.git

Configuración:

Revisa el archivo src/main/resources/application.properties y asegúrate de que las credenciales de MySQL (user y password) coincidan con las de tu XAMPP.

Ejecución con Maven:

Bash
mvn spring-boot:run

Pruebas de la API:

Puedes utilizar Postman para testear los endpoints de la API (JSON) importando la colección de rutas del proyecto.  

💡 Nota sobre el flujo de trabajo
Este proyecto utiliza una arquitectura modular que facilita el mantenimiento y futuras actualizaciones, garantizando que operaciones críticas como el registro de citas o finanzas no generen duplicidad de información.
