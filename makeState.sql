use FinalProject;
drop table if exists State;

create table State(
    State_ID int(10) not null auto_increment,
    State varchar(42),
    tax_rate int(11),
    PRIMARY KEY (State_ID)
);

insert into State(State, tax_rate)  select DISTINCT ct.State, ct.taxrate from contacts ct;



ALTER TABLE contacts
	ADD COLUMN State_ID INT(11);
ALTER TABLE contacts
    ADD FOREIGN KEY (State_ID) REFERENCES state(State_ID);

UPDATE contacts
	INNER JOIN State
	ON State.State = contacts.State
    and State.tax_rate = contacts.taxrate
	SET contacts.State_ID = State.State_ID
	WHERE State.State IS NOT NULL;

SELECT st.State, ct.State, st.tax_rate, ct.taxrate
	FROM State AS st
		INNER JOIN contacts AS ct
	ON st.State_ID = ct.State_ID;
