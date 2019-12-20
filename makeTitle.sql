use FinalProject;
drop table if exists title;

update contacts
set title = null
where title = '';



create table title(
    title_ID int(10) not null auto_increment,
    title varchar(10),
    PRIMARY KEY (title_ID)
)
    SELECT DISTINCT title
	FROM contacts
	WHERE title IS NOT NULL
	ORDER BY title;


ALTER TABLE contacts
	ADD COLUMN title_ID INT(11);
ALTER TABLE contacts
    ADD FOREIGN KEY (title_ID) REFERENCES title(title_ID) ;

UPDATE contacts
	INNER JOIN title
	ON title.title = contacts.title
	SET contacts.title_ID = title.title_ID
	WHERE title.title IS NOT NULL;

SELECT ti.title, ct.title
	FROM title AS ti
		INNER JOIN contacts AS ct
	ON ct.title_ID = ti.title_ID;
