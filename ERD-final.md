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
        numeric salary_min
        numeric salary_max
        string employment_type
        date application_deadline
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
        string status
        datetime createdAt
        datetime updatedAt
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
    EDUCATION {
        int id PK
        int candidate_id FK
        string institution
        string title
        date startDate
        date endDate
    }
    WORK_EXPERIENCE {
        int id PK
        int candidate_id FK
        string company
        string position
        string description
        date startDate
        date endDate
    }
    RESUME {
        int id PK
        int candidate_id FK
        string filePath
        string fileType
        date uploadDate
    }
    SKILL {
        int id PK
        string name
    }
    CANDIDATE_SKILL {
        int candidate_id FK
        int skill_id FK
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
    CANDIDATE ||--o{ EDUCATION : has
    CANDIDATE ||--o{ WORK_EXPERIENCE : has
    CANDIDATE ||--o{ RESUME : has
    CANDIDATE ||--o{ CANDIDATE_SKILL : has
    SKILL ||--o{ CANDIDATE_SKILL : belongs_to