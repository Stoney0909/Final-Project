USE FinalProject;

drop table if exists CreatedBy;

create table CreatedBy(
    CreatedBy_ID int(10) not null auto_increment,
    CreatedBy varchar(42),
    PRIMARY KEY (CreatedBy_ID)
)
	SELECT DISTINCT CreatedBy
	FROM invoices
	WHERE CreatedBy IS NOT NULL
	ORDER BY CreatedBy;


ALTER TABLE invoices
	ADD COLUMN CreatedBy_ID INT(11);
ALTER TABLE invoices
    ADD FOREIGN KEY (CreatedBy_ID) REFERENCES CreatedBy(CreatedBy_ID) ;

UPDATE invoices
	INNER JOIN CreatedBy
	ON CreatedBy.CreatedBy = invoices.CreatedBy
	SET invoices.CreatedBy_ID = CreatedBy.CreatedBy_ID
	WHERE CreatedBy.CreatedBy IS NOT NULL;

SELECT inv.CreatedBy, cb.CreatedBy
	FROM CreatedBy AS cb
		INNER JOIN invoices AS inv
	ON cb.CreatedBy_ID = inv.CreatedBy_ID;

