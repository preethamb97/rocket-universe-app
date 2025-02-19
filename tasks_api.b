* tasks_api.b - Main API Handler for Task Manager
* Author: Your Name
* Date: YYYY-MM-DD

    $INCLUDE UNIVERSE.INCLUDE UVGLOBAL.H
    $INCLUDE task_def.h

SUBROUTINE TASKS.API(CONTROL.FLAGS, PARAMS, RESPONSE)
* Main API router for task management
* CONTROL.FLAGS<1> contains HTTP method
* PARAMS<1> contains endpoint
* PARAMS<2> contains request body (if any)

    RESPONSE = ''
    METHOD = CONTROL.FLAGS<1>
    ENDPOINT = PARAMS<1>

    BEGIN CASE
        CASE METHOD = 'GET' AND ENDPOINT = '/tasks'
            GOSUB GET.ALL.TASKS
        CASE METHOD = 'GET' AND ENDPOINT MATCHES '/tasks/\d+'
            GOSUB GET.TASK
        CASE METHOD = 'POST' AND ENDPOINT = '/tasks'
            GOSUB CREATE.TASK
        CASE METHOD = 'PUT' AND ENDPOINT MATCHES '/tasks/\d+'
            GOSUB UPDATE.TASK
        CASE METHOD = 'DELETE' AND ENDPOINT MATCHES '/tasks/\d+'
            GOSUB DELETE.TASK
    END CASE

    RETURN

GET.ALL.TASKS:
    SQL.STMT = "SELECT * FROM TASKS"
    EXECUTE SQL.STMT CAPTURING RESPONSE
    RETURN

GET.TASK:
    TASK.ID = FIELD(ENDPOINT, '/', 3)
    SQL.STMT = "SELECT * FROM TASKS WHERE ID = '" : TASK.ID : "'"
    EXECUTE SQL.STMT CAPTURING RESPONSE
    RETURN

CREATE.TASK:
    TASK.DATA = PARAMS<2>
    GOSUB VALIDATE.TASK.DATA
    IF ERROR.FLAG THEN RETURN
    
    SQL.STMT = "INSERT INTO TASKS (TITLE, DESCRIPTION, STATUS, CREATED_AT) VALUES ("
    SQL.STMT := "'" : TASK.DATA<1> : "', "
    SQL.STMT := "'" : TASK.DATA<2> : "', "
    SQL.STMT := "'pending', "
    SQL.STMT := "CURRENT_TIMESTAMP)"
    
    EXECUTE SQL.STMT CAPTURING RESPONSE
    RETURN

UPDATE.TASK:
    TASK.ID = FIELD(ENDPOINT, '/', 3)
    TASK.DATA = PARAMS<2>
    GOSUB VALIDATE.TASK.DATA
    IF ERROR.FLAG THEN RETURN
    
    SQL.STMT = "UPDATE TASKS SET "
    SQL.STMT := "TITLE = '" : TASK.DATA<1> : "', "
    SQL.STMT := "DESCRIPTION = '" : TASK.DATA<2> : "', "
    SQL.STMT := "STATUS = '" : TASK.DATA<3> : "' "
    SQL.STMT := "WHERE ID = '" : TASK.ID : "'"
    
    EXECUTE SQL.STMT CAPTURING RESPONSE
    RETURN

DELETE.TASK:
    TASK.ID = FIELD(ENDPOINT, '/', 3)
    SQL.STMT = "DELETE FROM TASKS WHERE ID = '" : TASK.ID : "'"
    EXECUTE SQL.STMT CAPTURING RESPONSE
    RETURN

VALIDATE.TASK.DATA:
    ERROR.FLAG = 0
    IF TASK.DATA<1> = '' THEN
        RESPONSE = '{"error": "Title is required"}'
        ERROR.FLAG = 1
        RETURN
    END
    RETURN

END 