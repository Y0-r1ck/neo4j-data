
Neo4j CSV Import Voorbeeld:

LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
CREATE (:Customer {
    customerId: toInteger(row.`customerId:ID(Customer)`),
    full_name: row.full_name,
    username: row.username,
    dob: row.dob,
    email: row.email
});

Gebruik daarna MATCH + CREATE voor relaties.
