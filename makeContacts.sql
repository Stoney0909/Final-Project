USE FinalProject;
drop table if exists contacts;

create table contacts(
    contact_ID int(10) not null auto_increment,
    fullname varchar(42),
    firstname varchar(42),
    lastname varchar(42),
    jobtitle varchar(42),
    city varchar(42),
    state varchar(42),
    PostalCode int(10),
    company varchar(42),
    street varchar(42),
    phone char(12),
    fax char(12),
    title varchar(8),
    taxrate int(11),
    email varchar(42),
    DiscountRate int(11),
    PRIMARY KEY (contact_ID)
);





INSERT INTO contacts(firstname, lastname, fullname, city, state, PostalCode, company, street, phone, fax, title, taxrate, email, DiscountRate)
SELECT DISTINCT inv.FirstName,inv.LastName, inv.FullName, inv.City, inv.State, inv.PostalCode, inv.Company, inv.Street, inv.Phone, inv.Fax, inv.Title, inv.TaxRate, inv.email,inv.DiscountRate
from invoices inv;


ALTER TABLE invoices
	ADD COLUMN BilledTo INT(11);
ALTER TABLE invoices
    ADD FOREIGN KEY (BilledTo) REFERENCES contacts(contact_ID);

ALTER TABLE invoices
	ADD COLUMN SentTo INT(11);
ALTER TABLE invoices
    ADD FOREIGN KEY (SentTo) REFERENCES contacts(contact_ID);

UPDATE invoices
	INNER JOIN contacts
	ON contacts.fullname = invoices.FullName
	       and contacts.PostalCode = invoices.PostalCode
	       and contacts.company = invoices.Company
           and contacts.city = invoices.City
           and contacts.state = invoices.State
           and contacts.company = invoices.Company
           and contacts.street = invoices.Street
	       and contacts.phone = invoices.Phone
	       and contacts.fax = invoices.Fax
	       and contacts.email = invoices.Email
           and contacts.DiscountRate = invoices.DiscountRate
	SET invoices.BilledTo = contacts.contact_ID, invoices.SentTo = contacts.contact_ID
	WHERE contacts.fullname IS NOT NULL;




SELECT inv.FirstName, ct.firstname
	FROM contacts AS ct
		INNER JOIN invoices AS inv
	ON ct.contact_ID = inv.Contact_ID;
