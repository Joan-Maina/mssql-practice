SELECT TOP 1 salary 
FROM (  
      SELECT DISTINCT TOP 3 salary  
      FROM staff.employees  
      ORDER BY salary DESC  
      )   
ORDER BY salary;