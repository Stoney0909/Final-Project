USE FinalProject;
drop table if exists ShipVia;

create table ShipVia(
    Shipper_ID int(10) not null auto_increment,
    ShipVia varchar(42),
    PRIMARY KEY (Shipper_ID)
)
	SELECT DISTINCT ShipVia
	FROM invoices
	WHERE ShipVia IS NOT NULL
	ORDER BY ShipVia;


ALTER TABLE invoices
	ADD COLUMN Shipper_ID INT(11);
ALTER TABLE invoices
    ADD FOREIGN KEY (Shipper_ID) REFERENCES ShipVia(Shipper_ID);

UPDATE invoices
	INNER JOIN ShipVia
	ON ShipVia.ShipVia = invoices.ShipVia
	SET invoices.Shipper_ID = ShipVia.Shipper_ID
	WHERE ShipVia.ShipVia IS NOT NULL;

SELECT inv.ShipVia, sv.ShipVia
	FROM ShipVia AS sv
		INNER JOIN invoices AS inv
	ON sv.Shipper_ID = inv.Shipper_ID;

