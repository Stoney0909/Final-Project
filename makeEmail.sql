use FinalProject;
drop table if exists Email;


create table Email(
    Contact_ID int(10) not null,
    Email varchar(42),
    type varchar(12),
    FOREIGN KEY (Contact_ID) references contacts(contact_ID)
);
insert into Email select contact_ID, 'work' email from contacts;

SELECT em.email, ct.email
	FROM email AS em
		INNER JOIN contacts AS ct
	ON ct.contact_ID = em.Contact_ID;
