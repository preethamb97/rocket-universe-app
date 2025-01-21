* test_tasks_api.b - Test Task API
* Author: Your Name
* Date: YYYY-MM-DD

    CONTROL.FLAGS = ''
    PARAMS = ''
    RESPONSE = ''

    * Test GET all tasks
    CONTROL.FLAGS<1> = 'GET'
    PARAMS<1> = '/tasks'
    CALL TASKS.API(CONTROL.FLAGS, PARAMS, RESPONSE)
    PRINT "GET ALL TASKS RESPONSE: ": RESPONSE

    * Test CREATE task
    CONTROL.FLAGS<1> = 'POST'
    PARAMS<1> = '/tasks'
    PARAMS<2> = 'Test Task@This is a test task'
    CALL TASKS.API(CONTROL.FLAGS, PARAMS, RESPONSE)
    PRINT "CREATE TASK RESPONSE: ": RESPONSE 