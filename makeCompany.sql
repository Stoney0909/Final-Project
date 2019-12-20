use FinalProject;
drop table if exists Company;

create table Company(
    Company_ID int(10) not null auto_increment,
    Company varchar(42),
    DiscountRate int(11),
    PRIMARY KEY (Company_ID)
);
insert into Company(Company, DiscountRate)  select company, DiscountRate from contacts


ALTER TABLE contacts
	ADD COLUMN Company_ID INT(11);
ALTER TABLE contacts
    ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID);

UPDATE contacts
	INNER JOIN Company
	ON Company.Company = contacts.Company
    and Company.DiscountRate = contacts.DiscountRate
	SET contacts.Company_ID = Company.Company_ID
	WHERE Company.Company IS NOT NULL;

SELECT co.Company, ct.Company
	FROM Company AS co
		INNER JOIN contacts AS ct
	ON ct.Company_ID = co.Company_ID;
