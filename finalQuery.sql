"SELECT d.DEPARTMENT_NAME,\n" +
               "  AVG(TIMESTAMPDIFF(YEAR, e.DOB, CURDATE())) AS AVERAGE_AGE,\n" +
               "  TRIM(BOTH ', ' FROM SUBSTRING_INDEX(\n" +
               "    GROUP_CONCAT(CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) ORDER BY e.EMP_ID SEPARATOR ', '),\n" +
               "    ',', 10\n" +
               "  )) AS EMPLOYEE_LIST\n" +
               "FROM DEPARTMENT d\n" +
               "JOIN EMPLOYEE e ON d.DEPARTMENT_ID = e.DEPARTMENT\n" +
               "JOIN PAYMENTS p ON e.EMP_ID = p.EMP_ID\n" +
               "WHERE p.AMOUNT > 70000\n" +
               "GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME\n" +
               "ORDER BY d.DEPARTMENT_ID DESC";
