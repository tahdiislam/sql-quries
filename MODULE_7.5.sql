-- 1. Show the employee names and corresponding job_titles without using JOIN query

SELECT EMP.FIRST_NAME, JOBS.JOB_TITLE
FROM EMPLOYEES AS EMP, JOBS
WHERE EMP.JOB_ID = JOBS.JOB_ID;

-- 2. Do the question no 1 using JOIN query

SELECT EMP.FIRST_NAME, JOBS.JOB_TITLE
FROM EMPLOYEES AS EMP JOIN JOBS USING(JOB_ID);

-- 3. Show the name of the employee and the job_title who receives the maximum salary

SELECT EMP.FIRST_NAME, JOBS.JOB_TITLE
FROM EMPLOYEES AS EMP JOIN JOBS USING(JOB_ID)
WHERE SALARY = (SELECT MAX(SALARY)
				FROM EMPLOYEES);
                
-- 4. Show the list of employee name and corresponding manager names.

SELECT EMP.FIRST_NAME AS EMPLOYEE, MAN.FIRST_NAME AS MANAGER
FROM EMPLOYEES AS EMP JOIN EMPLOYEES AS MAN ON EMP.MANAGER_ID = MAN.EMPLOYEE_ID