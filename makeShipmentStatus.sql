use FinalProject;
drop table if exists ShipmentStatus;

create table ShipmentStatus(
    ShipmentStatus_ID int(10) not null auto_increment,
    ShipmentStatus char (10),
    PRIMARY KEY (ShipmentStatus_ID)
)
    SELECT DISTINCT ShipmentStatus
	FROM invoices
	WHERE ShipmentStatus IS NOT NULL
	ORDER BY ShipmentStatus;


ALTER TABLE invoices
	ADD COLUMN ShipmentStatus_ID INT(11);
ALTER TABLE invoices
    ADD FOREIGN KEY (ShipmentStatus_ID) REFERENCES shipmentstatus(ShipmentStatus_ID) ;

UPDATE invoices
	INNER JOIN ShipmentStatus
	ON ShipmentStatus.ShipmentStatus = invoices.ShipmentStatus
	SET invoices.ShipmentStatus_ID = ShipmentStatus.ShipmentStatus_ID
	WHERE ShipmentStatus.ShipmentStatus IS NOT NULL;

SELECT ship.ShipmentStatus, inv.ShipmentStatus
	FROM ShipmentStatus AS ship
		INNER JOIN invoices AS inv
	ON inv.ShipmentStatus_ID = ship.ShipmentStatus_ID;
