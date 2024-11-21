# Prompts

Using Copilot

## Prompt 1

@workspace I want you to analyze the current database model for this application because I want to update it; this model was created in the backend using prisma, the schema file is #file:schema.prisma and the file is migrations #file:migration.sql . For now I want you to anzlyze and get the context of the application befre doing any changes, please write a summary and ask me any question if you need it.

migration.sql
schema.prisma

## Prompt 2

@workspace  I am goind to provide for you a mermaid diagram with the new database schema, I want you to take this diagram to compare with the current database model so you can answer those questions; let me know if you have more doubt after you analyze the mermaid or tell me if all is good for you before doing the changes. The following is the mermaid diagram: --- erDiagram
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

## Prompt 3

@workspace I don't want to remove the models models Education, WorkExperience, and Resume; I want you to add the new ones or add changes, please compare them again for adding or altering the models.

## Prompt 4

@workspace when runnning the script to add new migrations I have an error, looks like we need to add some changes in Candidate, this is the error: --- Error: Prisma schema validation - (validate wasm)
Error code: P1012
error: Error validating field `candidate` in model `Application`: The relation field `candidate` on model `Application` is missing an 
opposite relation field on the model `Candidate`. Either run `prisma format` or add it manually.
  -->  prisma\schema.prisma:134
   | 
133 |   position         Position    @relation(fields: [position_id], references: [id])
134 |   candidate        Candidate   @relation(fields: [candidate_id], references: [id])
135 |   interviews       Interview[]
   |

Validation Error Count: 1
[Context: validate]

## Prompt 5

@workspace I want you to create an ERD with all the entities and their relationships, please use mermaid diagram; after having the diagram analyze it and let me know if it needs an improvements, please explain if we need new index, foreign keys or need a normalization to reduce data reduncy or to improve the integrity.

## Prompt 6

@workspace generate the prisma schema to create a migration with the new indexes and/or foreigh keys that you are proposing.