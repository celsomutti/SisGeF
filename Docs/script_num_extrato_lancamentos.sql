ALTER TABLE TBLANCAMENTOS
ADD NUM_EXTRATO INTEGER
DEFAULT 0 ;

CREATE INDEX TBLANCAMENTOS_IDX5
ON TBLANCAMENTOS (NUM_EXTRATO);

