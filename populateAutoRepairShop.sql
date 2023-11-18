USE AutoRepairShop;

DELIMITER //

CREATE PROCEDURE PopulateEmployeeType()
BEGIN
	DECLARE id int;
    DECLARE str varchar(10);
    
    SET id = 1;
    SET str = "";
    
    loop_label:  LOOP
		IF id > 100 THEN 
			LEAVE  loop_label;
		END  IF;
        
		SET str =  SUBSTR(MD5(RAND()), 1, 5);
        
        INSERT INTO EmployeeType(employeeTypeID, type) 
		VALUES (id, str); 
		
        SET  id = id + 1;
	END LOOP;
    
END //

DELIMITER ;

