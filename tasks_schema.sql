CREATE TABLE TASKS (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    TITLE VARCHAR(100) NOT NULL,
    DESCRIPTION TEXT,
    STATUS VARCHAR(20) DEFAULT 'pending',
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_tasks_status ON TASKS(STATUS); 