# LTI - Actualización del modelo de datos
## IDE: ChatGPT 4

## Link de la conversación completa
[Conversación de ChatGPT](https://chatgpt.com/share/1e27b35f-1949-4290-ac6d-32e8eb587104)

## Secuencia de prompts
### Prompt 1
Actúa como un experto en administración de bases de datos SQL y NoSQL. Debes asistirme para actualizar la base de datos de un proyecto teniendo en cuenta la siguiente información:

  <details>
    <summary>Click para más detalles</summary>

    ```Markdown
        ## Nombre de la aplicación: LTI - Sistema de seguimiento de talento

        ## Descripción de la aplicación: Plataforma de reclutamiento de talento donde los candidatos pueden agregar su información personal como nombre, apellido, correo electrónico, teléfono, dirección, cv, educación y experiencia laboral para poder postular a diferentes posiciones laborales

        ## Stack tecnológico:
        - Backend con Node.js y express
        - Prisma como ORM
        - Base de datos PosgreSQL## Modelo actual de datos con **Prisma ORM**:
        ```model Candidate {
          id                Int               @id @default(autoincrement())
          firstName         String            @db.VarChar(100)
          lastName          String            @db.VarChar(100)
          email             String            @unique @db.VarChar(255)
          phone             String?           @db.VarChar(15)
          address           String?           @db.VarChar(100)
          educations        Education[]
          workExperiences   WorkExperience[]
          resumes           Resume[]
        }

        model Education {
          id            Int       @id @default(autoincrement())
          institution   String    @db.VarChar(100)
          title         String    @db.VarChar(250)
          startDate     DateTime
          endDate       DateTime?
          candidateId   Int
          candidate     Candidate @relation(fields: [candidateId], references: [id])
        }

        model WorkExperience {
          id          Int       @id @default(autoincrement())
          company     String    @db.VarChar(100)
          position    String    @db.VarChar(100)
          description String?   @db.VarChar(200)
          startDate   DateTime
          endDate     DateTime?
          candidateId Int
          candidate   Candidate @relation(fields: [candidateId], references: [id])
        }

        model Resume {
          id          Int       @id @default(autoincrement())
          filePath    String    @db.VarChar(500)
          fileType    String    @db.VarChar(50)
          uploadDate  DateTime
          candidateId Int
          candidate   Candidate @relation(fields: [candidateId], references: [id])
        }
        ```
        ## Diagrama ERD en formato **Mermaid** con nuevas entidades a agregar al modelo de datos:
        ```
        erDiagram
            COMPANY {
                int id PK
                string name
            }
            EMPLOYEE {
                int id PK
                int company_id FK
                string name
                string email
                string role
                boolean is_active
            }
            POSITION {
                int id PK
                int company_id FK
                int interview_flow_id FK
                string title
                text description
                string status
                boolean is_visible
                string location
                text job_description
                text requirements
                text responsibilities
                numeric salary_min
                numeric salary_max
                string employment_type
                text benefits
                text company_description
                date application_deadline
                string contact_info
            }
            INTERVIEW_FLOW {
                int id PK
                string description
            }
            INTERVIEW_STEP {
                int id PK
                int interview_flow_id FK
                int interview_type_id FK
                string name
                int order_index
            }
            INTERVIEW_TYPE {
                int id PK
                string name
                text description
            }
            CANDIDATE {
                int id PK
                string firstName
                string lastName
                string email
                string phone
                string address
            }
            APPLICATION {
                int id PK
                int position_id FK
                int candidate_id FK
                date application_date
                string status
                text notes
            }
            INTERVIEW {
                int id PK
                int application_id FK
                int interview_step_id FK
                int employee_id FK
                date interview_date
                string result
                int score
                text notes
            }

            COMPANY ||--o{ EMPLOYEE : employs
            COMPANY ||--o{ POSITION : offers
            POSITION ||--|| INTERVIEW_FLOW : assigns
            INTERVIEW_FLOW ||--o{ INTERVIEW_STEP : contains
            INTERVIEW_STEP ||--|| INTERVIEW_TYPE : uses
            POSITION ||--o{ APPLICATION : receives
            CANDIDATE ||--o{ APPLICATION : submits
            APPLICATION ||--o{ INTERVIEW : has
            INTERVIEW ||--|| INTERVIEW_STEP : consists_of
            EMPLOYEE ||--o{ INTERVIEW : conducts
        ```

        ## Pasos a seguir para la implementación:
        1. Analiza el modelo actual de datos e indícame si hay alguna mejora
        1. Convierte el diagrama ERD suministrado a un script SQL
        2. A partir del script SQL, generar un script de migración de datos en Prisma (solo de las nuevas entidades a agregar)
        3. Actualizar el modelo de datos actual con el script de las nuevas entidades a agregar
        4. Haz una última revisión de las buenas prácticas para obtener mejoras en rendimiento

        ## Aspectos clave a tener en cuenta:
        - Haz uso de buenas prácticas como la definición de índices y normalización de la base de datos
        - Revisa los pasos a seguir que te acabo de indicar y dime si hizo falta alguno otro por tener en cuenta
        - No comiences a darme el código hasta que yo no te lo confirme
        - Vamos a ir paso a paso para ir analizando el resultado y corrigiendo los errores de forma más fácil (si los hay)
        - Necesito una explicación detallada de cada paso para ir aprendiendo por el camino así que no supongas nada (soy un novato en el tema)
    ```
  </details>

#### Respuesta
¡Perfecto, Daniel! Vamos paso a paso. Empezamos con el análisis del modelo de datos actual y de las entidades nuevas.

Paso 1: Análisis del modelo actual de datos

En el modelo de datos actual, tienes tres tablas principales: Candidate, Education, WorkExperience, y Resume, con las relaciones adecuadas entre ellas. Aquí hay algunos puntos a considerar para mejorar el modelo antes de agregar las nuevas entidades:

Posibles mejoras:

1.	Longitud de campos de texto: Actualmente tienes restricciones como VarChar(100) o VarChar(250) en varios campos como firstName, lastName, etc. Dependiendo de las necesidades del sistema, podrías ajustar esas longitudes según los requisitos reales o eliminar limitaciones si no son necesarias (por ejemplo, algunos apellidos pueden superar los 100 caracteres).
2.	Campos opcionales: Los campos como phone y address son opcionales (String?). Es importante asegurarse de que efectivamente sean opcionales y validar adecuadamente esos campos en el backend para evitar errores o datos inconsistentes.
3.	Índices y performance:
•	Actualmente, solo tienes el índice unique en el campo email de Candidate, lo cual está bien porque los emails deben ser únicos. Sin embargo, podrías considerar agregar índices en campos que se busquen frecuentemente, como lastName o phone, dependiendo de los requisitos del negocio.
4.	Normalización: El modelo parece bastante normalizado, lo que es bueno para evitar duplicación de datos. La normalización de entidades adicionales también será clave para mantener la consistencia de datos.

¿Te gustaría añadir o mejorar algo en esta primera parte del análisis o seguimos con el paso 2, que sería convertir el diagrama ERD a un script SQL para las nuevas entidades?

Avísame y seguimos avanzando.

### Prompt 2
Con base en tu analisis favorable sobre el modelo actual de datos, he decidido no agregar ninguna mejora por el momento. Continúa con el siguiente paso

#### Respuesta
¡Genial! Sigamos entonces con el Paso 2: Convertir el diagrama ERD suministrado a un script SQL.

Paso 2: Script SQL basado en el diagrama ERD

Este script creará las nuevas entidades Company, Employee, Position, InterviewFlow, InterviewStep, InterviewType, Application, e Interview, que aún no están en tu modelo de datos actual.

Aquí te dejo el script para crear las tablas correspondientes en PostgreSQL:

<details>
  <summary>script</summary>

  ```sql
-- Tabla Company
CREATE TABLE "Company" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

-- Tabla Employee
CREATE TABLE "Employee" (
    "id" SERIAL PRIMARY KEY,
    "company_id" INT REFERENCES "Company"(id) ON DELETE CASCADE,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "role" VARCHAR(50),
    "is_active" BOOLEAN DEFAULT TRUE
);

-- Tabla Position
CREATE TABLE "Position" (
    "id" SERIAL PRIMARY KEY,
    "company_id" INT REFERENCES "Company"(id) ON DELETE CASCADE,
    "interview_flow_id" INT REFERENCES "InterviewFlow"(id) ON DELETE SET NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "status" VARCHAR(50) NOT NULL,
    "is_visible" BOOLEAN DEFAULT TRUE,
    "location" VARCHAR(255),
    "job_description" TEXT,
    "requirements" TEXT,
    "responsibilities" TEXT,
    "salary_min" NUMERIC,
    "salary_max" NUMERIC,
    "employment_type" VARCHAR(50),
    "benefits" TEXT,
    "company_description" TEXT,
    "application_deadline" DATE,
    "contact_info" VARCHAR(255)
);

-- Tabla InterviewFlow
CREATE TABLE "InterviewFlow" (
    "id" SERIAL PRIMARY KEY,
    "description" TEXT
);

-- Tabla InterviewStep
CREATE TABLE "InterviewStep" (
    "id" SERIAL PRIMARY KEY,
    "interview_flow_id" INT REFERENCES "InterviewFlow"(id) ON DELETE CASCADE,
    "interview_type_id" INT REFERENCES "InterviewType"(id) ON DELETE SET NULL,
    "name" VARCHAR(100) NOT NULL,
    "order_index" INT NOT NULL
);

-- Tabla InterviewType
CREATE TABLE "InterviewType" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT
);

-- Tabla Application
CREATE TABLE "Application" (
    "id" SERIAL PRIMARY KEY,
    "position_id" INT REFERENCES "Position"(id) ON DELETE CASCADE,
    "candidate_id" INT REFERENCES "Candidate"(id) ON DELETE CASCADE,
    "application_date" DATE NOT NULL,
    "status" VARCHAR(50),
    "notes" TEXT
);

-- Tabla Interview
CREATE TABLE "Interview" (
    "id" SERIAL PRIMARY KEY,
    "application_id" INT REFERENCES "Application"(id) ON DELETE CASCADE,
    "interview_step_id" INT REFERENCES "InterviewStep"(id) ON DELETE CASCADE,
    "employee_id" INT REFERENCES "Employee"(id) ON DELETE SET NULL,
    "interview_date" DATE,
    "result" VARCHAR(50),
    "score" INT,
    "notes" TEXT
);
```
</details>
<br>
Explicación del Script:

- Relaciones:
  - Employee está relacionado con Company (una empresa tiene muchos empleados).
  - Position está relacionado con Company y con InterviewFlow (un flujo de entrevistas es opcional para una posición).
  - Application conecta a los Candidate (ya en tu modelo actual) con las Position.
  - Interview conecta Application, InterviewStep, y Employee.
- Referencias y restricciones:
  - Las claves foráneas (FOREIGN KEY) tienen las acciones ON DELETE, como CASCADE para eliminar en cascada o SET NULL en caso de eliminación de algunos registros relacionados.
- Índices:
  - Se incluye un índice único en el campo email de Employee, ya que probablemente sea necesario garantizar que no haya duplicados en los correos electrónicos.

Esto cubriría la estructura de las nuevas tablas. Una vez revises y te sientas cómodo, pasamos al siguiente paso, que sería generar un script de migración en Prisma para las nuevas entidades.

¿Cómo lo ves hasta ahora?

### Prompt 3
Bien por el momento. Antes de continuar con el siguiente paso, dame una explicación detallada de las acciones "ON DELETE" que propones

#### Respuesta
Perfecto, Daniel! Vamos a desglosar las acciones ON DELETE que propongo en el script SQL y cómo funcionan en términos de integridad referencial.

Explicación de las acciones ON DELETE en las claves foráneas

Cuando definimos una clave foránea en una tabla, queremos controlar lo que sucede con los registros relacionados si el registro en la tabla “padre” (la tabla referenciada) es eliminado. Esto es importante para mantener la consistencia de los datos. Existen varias acciones posibles que podemos usar con ON DELETE. Te explico las más relevantes:

1. ON DELETE CASCADE

    Cuando especificamos ON DELETE CASCADE, si el registro “padre” es eliminado, los registros “hijos” relacionados también serán eliminados automáticamente. Esto es útil cuando deseas borrar todos los datos dependientes de forma automática, manteniendo la base de datos limpia sin registros huérfanos.

    Ejemplo:

    - En el caso de la relación entre Company y Employee:
      ```sql
      company_id INT REFERENCES "Company"(id) ON DELETE CASCADE
      ```
    Si una Company es eliminada, todos los empleados (Employee) asociados a esa empresa también serán eliminados automáticamente.
    Ventaja: Esto asegura que no haya empleados sin una empresa asignada (registros huérfanos) en la tabla Employee.

2. ON DELETE SET NULL

    ON DELETE SET NULL es una opción que asigna NULL al campo foráneo en los registros “hijos” cuando el registro “padre” es eliminado. Esto es útil si deseas mantener los registros “hijos”, pero ya no tienen una relación válida con el registro “padre”.

    Ejemplo:

    - En la relación entre InterviewStep y InterviewType:
      ```sql
      interview_type_id INT REFERENCES "InterviewType"(id) ON DELETE SET NULL
      ```
      Si un InterviewType (tipo de entrevista) es eliminado, los pasos de entrevista (InterviewStep) que lo usaban tendrán el valor de interview_type_id como NULL. El registro en InterviewStep no será eliminado, pero ya no tendrá un tipo de entrevista asociado.
      Ventaja: Permite que el paso de la entrevista siga existiendo, pero sin un tipo de entrevista si este ya no es relevante.

3. ON DELETE NO ACTION (Comportamiento por defecto)

    Este es el comportamiento por defecto si no especificas ninguna acción. NO ACTION simplemente significa que no se hará nada automáticamente si el registro “padre” es eliminado. Sin embargo, si intentas eliminar un registro “padre” que tiene registros “hijos” referenciados, obtendrás un error de restricción referencial, impidiendo la eliminación.

    Ejemplo:

    Si no configuráramos ninguna acción para la relación Employee con Company:
    ```sql
    company_id INT REFERENCES "Company"(id)
    ```
    Si intentas eliminar una empresa (Company) que tiene empleados (Employee) relacionados, obtendrías un error.

    Inconveniente: Esto requiere que gestionemos manualmente la eliminación de registros relacionados.

4. ON DELETE RESTRICT

    ON DELETE RESTRICT es similar a NO ACTION, ya que no permite la eliminación si hay registros relacionados. La diferencia es que RESTRICT asegura que la restricción sea evaluada inmediatamente (incluso antes de que se ejecute la consulta completa).

  Resumen de las acciones propuestas en tu caso:

  - ON DELETE CASCADE: Usado cuando eliminar el “padre” debe también eliminar los “hijos”. Ejemplos:
  - Company elimina sus Employee.
  - Position elimina sus Application.
  - ON DELETE SET NULL: Usado cuando eliminar el “padre” solo debe desvincular la relación, pero no eliminar el “hijo”. Ejemplos:
  - InterviewFlow en Position.
  - InterviewType en InterviewStep.

  Esto ayuda a manejar las relaciones de manera más eficiente y evitar datos huérfanos o inconsistentes.

¿Te queda claro este concepto? ¿Listo para seguir con el siguiente paso?

### Prompt 4
Perfecto, continúa con el siguiente paso

#### Respuesta
Me alegra que haya quedado claro! Vamos entonces con el Paso 3: Generar un script de migración de datos en Prisma para agregar las nuevas entidades.

Paso 3: Script de migración en Prisma para las nuevas entidades

En Prisma, para realizar cambios en el modelo de datos, lo primero que debemos hacer es modificar el archivo de esquema (schema.prisma) y luego generar una migración para aplicar esos cambios a la base de datos.

1. Actualización del archivo schema.prisma

    Aquí está la modificación del esquema de Prisma que incluye las nuevas entidades Company, Employee, Position, InterviewFlow, InterviewStep, InterviewType, Application, e Interview:
    ```prisma
    model Company {
      id       Int       @id @default(autoincrement())
      name     String    @db.VarChar(255)
      employees Employee[]
      positions Position[]
    }

    model Employee {
      id         Int      @id @default(autoincrement())
      companyId  Int
      company    Company  @relation(fields: [companyId], references: [id], onDelete: Cascade)
      name       String   @db.VarChar(100)
      email      String   @unique @db.VarChar(255)
      role       String?  @db.VarChar(50)
      isActive   Boolean  @default(true)
      interviews Interview[]
    }

    model Position {
      id                Int             @id @default(autoincrement())
      companyId         Int
      interviewFlowId   Int?
      company           Company         @relation(fields: [companyId], references: [id], onDelete: Cascade)
      interviewFlow     InterviewFlow?  @relation(fields: [interviewFlowId], references: [id], onDelete: SetNull)
      title             String          @db.VarChar(255)
      description       String?         @db.Text
      status            String          @db.VarChar(50)
      isVisible         Boolean         @default(true)
      location          String?         @db.VarChar(255)
      jobDescription    String?         @db.Text
      requirements      String?         @db.Text
      responsibilities  String?         @db.Text
      salaryMin         Float?
      salaryMax         Float?
      employmentType    String?         @db.VarChar(50)
      benefits          String?         @db.Text
      companyDescription String?        @db.Text
      applicationDeadline DateTime?
      contactInfo       String?         @db.VarChar(255)
      applications      Application[]
    }

    model InterviewFlow {
      id           Int             @id @default(autoincrement())
      description  String?         @db.Text
      positions    Position[]
      steps        InterviewStep[]
    }

    model InterviewStep {
      id              Int           @id @default(autoincrement())
      interviewFlowId Int
      interviewTypeId Int?
      interviewFlow   InterviewFlow  @relation(fields: [interviewFlowId], references: [id], onDelete: Cascade)
      interviewType   InterviewType? @relation(fields: [interviewTypeId], references: [id], onDelete: SetNull)
      name            String         @db.VarChar(100)
      orderIndex      Int
    }

    model InterviewType {
      id           Int             @id @default(autoincrement())
      name         String          @db.VarChar(100)
      description  String?         @db.Text
      steps        InterviewStep[]
    }

    model Application {
      id            Int          @id @default(autoincrement())
      positionId    Int
      candidateId   Int
      position      Position     @relation(fields: [positionId], references: [id], onDelete: Cascade)
      candidate     Candidate    @relation(fields: [candidateId], references: [id], onDelete: Cascade)
      applicationDate DateTime
      status        String?      @db.VarChar(50)
      notes         String?      @db.Text
      interviews    Interview[]
    }

    model Interview {
      id              Int             @id @default(autoincrement())
      applicationId   Int
      interviewStepId Int
      employeeId      Int?
      application     Application     @relation(fields: [applicationId], references: [id], onDelete: Cascade)
      interviewStep   InterviewStep   @relation(fields: [interviewStepId], references: [id], onDelete: Cascade)
      employee        Employee?       @relation(fields: [employeeId], references: [id], onDelete: SetNull)
      interviewDate   DateTime?
      result          String?         @db.VarChar(50)
      score           Int?
      notes           String?         @db.Text
    }
    ```
### Siguientes prompts
Ver conversación completa con ChatGPT ([Link de la conversación completa](#link-de-la-conversación-completa))