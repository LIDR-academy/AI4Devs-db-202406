-- Tablas normalizadas a 3NF

-- Tabla COMPANY (sin cambios)
CREATE TABLE COMPANY (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Tabla EMPLOYEE (sin cambios significativos)
CREATE TABLE EMPLOYEE (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(50) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (company_id) REFERENCES COMPANY(id)
);

-- Tabla INTERVIEW_FLOW (sin cambios)
CREATE TABLE INTERVIEW_FLOW (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL
);

-- Tabla POSITION (normalizada)
CREATE TABLE POSITION (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL,
    interview_flow_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(50) NOT NULL,
    is_visible BOOLEAN NOT NULL DEFAULT TRUE,
    location VARCHAR(100),
    employment_type VARCHAR(50),
    application_deadline DATE,
    contact_info VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES COMPANY(id),
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id)
);

-- Nueva tabla POSITION_DETAILS
CREATE TABLE POSITION_DETAILS (
    position_id INTEGER PRIMARY KEY,
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    benefits TEXT,
    company_description TEXT,
    FOREIGN KEY (position_id) REFERENCES POSITION(id)
);

-- Tabla INTERVIEW_TYPE (sin cambios)
CREATE TABLE INTERVIEW_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Tabla INTERVIEW_STEP (sin cambios)
CREATE TABLE INTERVIEW_STEP (
    id SERIAL PRIMARY KEY,
    interview_flow_id INTEGER NOT NULL,
    interview_type_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    order_index INTEGER NOT NULL,
    FOREIGN KEY (interview_flow_id) REFERENCES INTERVIEW_FLOW(id),
    FOREIGN KEY (interview_type_id) REFERENCES INTERVIEW_TYPE(id)
);

-- Tabla CANDIDATE (sin cambios significativos)
CREATE TABLE CANDIDATE (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(100)
);

-- Tabla APPLICATION (sin cambios)
CREATE TABLE APPLICATION (
    id SERIAL PRIMARY KEY,
    position_id INTEGER NOT NULL,
    candidate_id INTEGER NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    notes TEXT,
    FOREIGN KEY (position_id) REFERENCES POSITION(id),
    FOREIGN KEY (candidate_id) REFERENCES CANDIDATE(id)
);

-- Tabla INTERVIEW (sin cambios)
CREATE TABLE INTERVIEW (
    id SERIAL PRIMARY KEY,
    application_id INTEGER NOT NULL,
    interview_step_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    interview_date DATE NOT NULL,
    result VARCHAR(50),
    score INTEGER,
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES APPLICATION(id),
    FOREIGN KEY (interview_step_id) REFERENCES INTERVIEW_STEP(id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(id)
);

-- Tabla EDUCATION (sin cambios)
CREATE TABLE EDUCATION (
    id SERIAL PRIMARY KEY,
    institution VARCHAR(100) NOT NULL,
    title VARCHAR(250) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    candidateId INTEGER NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Tabla WORK_EXPERIENCE (sin cambios)
CREATE TABLE WORK_EXPERIENCE (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    startDate DATE NOT NULL,
    endDate DATE,
    candidateId INTEGER NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Tabla RESUME (sin cambios)
CREATE TABLE RESUME (
    id SERIAL PRIMARY KEY,
    filePath VARCHAR(500) NOT NULL,
    fileType VARCHAR(50) NOT NULL,
    uploadDate DATE NOT NULL,
    candidateId INTEGER NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES CANDIDATE(id)
);

-- Índices para optimizar consultas

-- Índices para EMPLOYEE
CREATE INDEX idx_employee_company ON EMPLOYEE(company_id);
CREATE INDEX idx_employee_email ON EMPLOYEE(email);

-- Índices para POSITION
CREATE INDEX idx_position_company ON POSITION(company_id);
CREATE INDEX idx_position_interview_flow ON POSITION(interview_flow_id);
CREATE INDEX idx_position_status ON POSITION(status);
CREATE INDEX idx_position_location ON POSITION(location);

-- Índices para INTERVIEW_STEP
CREATE INDEX idx_interview_step_flow ON INTERVIEW_STEP(interview_flow_id);
CREATE INDEX idx_interview_step_type ON INTERVIEW_STEP(interview_type_id);

-- Índices para CANDIDATE
CREATE INDEX idx_candidate_email ON CANDIDATE(email);
CREATE INDEX idx_candidate_name ON CANDIDATE(firstName, lastName);

-- Índices para APPLICATION
CREATE INDEX idx_application_position ON APPLICATION(position_id);
CREATE INDEX idx_application_candidate ON APPLICATION(candidate_id);
CREATE INDEX idx_application_date ON APPLICATION(application_date);
CREATE INDEX idx_application_status ON APPLICATION(status);

-- Índices para INTERVIEW
CREATE INDEX idx_interview_application ON INTERVIEW(application_id);
CREATE INDEX idx_interview_step ON INTERVIEW(interview_step_id);
CREATE INDEX idx_interview_employee ON INTERVIEW(employee_id);
CREATE INDEX idx_interview_date ON INTERVIEW(interview_date);

-- Índices para EDUCATION
CREATE INDEX idx_education_candidate ON EDUCATION(candidateId);

-- Índices para WORK_EXPERIENCE
CREATE INDEX idx_work_experience_candidate ON WORK_EXPERIENCE(candidateId);

-- Índices para RESUME
CREATE INDEX idx_resume_candidate ON RESUME(candidateId);