use FinalProject;
drop table if exists JobTitle;

create table JobTitle(
    JobTitle_ID int(10) not null auto_increment,
    JobTitle varchar(42),
    PRIMARY KEY (JobTitle_ID)
)
    SELECT DISTINCT JobTitle
	FROM contacts
	WHERE JobTitle IS NOT NULL
	ORDER BY JobTitle;


ALTER TABLE contacts
	ADD COLUMN JobTitle_ID INT(11);
ALTER TABLE contacts
    ADD FOREIGN KEY (JobTitle_Id) REFERENCES JobTitle(JobTitle_ID)   ;

UPDATE contacts
	INNER JOIN JobTitle
	ON JobTitle.JobTitle = contacts.JobTitle
	SET contacts.JobTitle_ID = JobTitle.JobTitle_ID
	WHERE JobTitle.JobTitle IS NOT NULL;

SELECT jt.JobTitle, ct.JobTitle
	FROM JobTitle AS jt
		INNER JOIN contacts AS ct
	ON ct.JobTitle_ID = jt.JobTitle_ID;
