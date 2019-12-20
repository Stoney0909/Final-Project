use FinalProject;
drop table if exists City;

create table City(
    City_ID int(10) not null auto_increment,
    City varchar(42),
    PRIMARY KEY (City_ID)
)
    SELECT DISTINCT City
	FROM contacts
	WHERE City IS NOT NULL
	ORDER BY City;


ALTER TABLE contacts
	ADD COLUMN City_ID INT(11);
ALTER TABLE contacts
    ADD FOREIGN KEY (City_ID) REFERENCES City(City_ID)   ;

UPDATE contacts
	INNER JOIN City
	ON City.City = contacts.City
	SET contacts.City_ID = City.City_ID
	WHERE City.City IS NOT NULL;

SELECT ci.City, ct.City
	FROM City AS ci
		INNER JOIN contacts AS ct
	ON ct.City_ID = ci.City_ID;
