# Github Copilot

## Prompt 1
>@workspace You're an amazing DBA expert. In the current project, in the backend folder, we have a migrations folder with the current database schema with Prisma migration.
>
>Could you explain me the different entities of the database and the flows of this application?

## Prompt 2
>@workspace with the current schema, we want to create a new migrations using Prisma code to apply changes from the following EDR:
>
>erDiagram COMPANY { int id PK string name } EMPLOYEE { int id PK int company_id FK string name string email string role boolean is_active } POSITION { int id PK int company_id FK int interview_flow_id FK string title text description string status boolean is_visible string location text job_description text requirements text responsibilities numeric salary_min numeric salary_max string employment_type text benefits text company_description date application_deadline string contact_info } INTERVIEW_FLOW { int id PK string description } INTERVIEW_STEP { int id PK int interview_flow_id FK int interview_type_id FK string name int order_index } INTERVIEW_TYPE { int id PK string name text description } CANDIDATE { int id PK string firstName string lastName string email string phone string address } APPLICATION { int id PK int position_id FK int candidate_id FK date application_date string status text notes } INTERVIEW { int id PK int application_id FK int interview_step_id FK int employee_id FK date interview_date string result int score text notes }
>
> COMPANY ||--o{ EMPLOYEE : employs
> COMPANY ||--o{ POSITION : offers
> POSITION ||--|| INTERVIEW_FLOW : assigns
> INTERVIEW_FLOW ||--o{ INTERVIEW_STEP : contains
> INTERVIEW_STEP ||--|| INTERVIEW_TYPE : uses
> POSITION ||--o{ APPLICATION : receives
> CANDIDATE ||--o{ APPLICATION : submits
> APPLICATION ||--o{ INTERVIEW : has
> INTERVIEW ||--|| INTERVIEW_STEP : consists_of
> EMPLOYEE ||--o{ INTERVIEW : conducts

## Prompt 3
>Candidate also exists in the previous definition, can you update the entity without removing the current definition?

## Prompt 4
>Ok, from the current new #schema.prisma file, could you provide me suggestion to normalize the database?

## Prompt 5
>I have this error: Native type VarChar is not supported for Default connector. Could you fix it?

## Prompt 6
>Sorry, the previous question was a mistake from my side, ignore the following questions, please ;)

## Prompt 7
>Ok, now, with the current schema in the file #file:schema.prisma Could you provide me suggestions to improve the quieres like new INDEXES, etc?

## Prompt 8
>What do you think about adding an INDEX for the columns salaryMax and salaryMin in the table position?