USE AutoRepairShop;

CREATE VIEW ServiceView AS
	SELECT * FROM Service INNER JOIN ServiceType;
    
SELECT * FROM ServiceView;
