// Company MAKES Snack
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/company_makes_snack.csv'
AS row
MATCH (c:Company {
    companyId: toInteger(row.`:START_ID(Company)`)
}),
(s:Snack {
    snackId: toInteger(row.`:END_ID(Snack)`)
})
CREATE (c)-[:MAKES]->(s);

// Snack BELONGS_TO SnackType
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/snack_belongs_type.csv'
AS row
MATCH (s:Snack {
    snackId: toInteger(row.`:START_ID(Snack)`)
}),
(t:SnackType {
    typeId: toInteger(row.`:END_ID(SnackType)`)
})
CREATE (s)-[:BELONGS_TO]->(t);

// Snack CONTAINS Ingredient
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/snack_contains_ingredient.csv'
AS row
MATCH (s:Snack {
    snackId: toInteger(row.`:START_ID(Snack)`)
}),
(i:Ingredient {
    ingredientId: toInteger(row.`:END_ID(Ingredient)`)
})
CREATE (s)-[:CONTAINS]->(i);

// Snack CONTAINS Allergy
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/snack_contains_allergy.csv'
AS row
MATCH (s:Snack {
    snackId: toInteger(row.`:START_ID(Snack)`)
}),
(a:Allergy {
    allergyId: toInteger(row.`:END_ID(Allergy)`)
})
CREATE (s)-[:CONTAINS]->(a);

// Customer PLACED Order
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/customer_placed_order.csv'
AS row
MATCH (c:Customer {
    customerId: toInteger(row.`:START_ID(Customer)`)
}),
(o:Order {
    orderId: toInteger(row.`:END_ID(Order)`)
})
CREATE (c)-[:PLACED]->(o);

// Order CONTAINS Snack
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/order_contains_snack.csv'
AS row
MATCH (o:Order {
    orderId: toInteger(row.`:START_ID(Order)`)
}),
(s:Snack {
    snackId: toInteger(row.`:END_ID(Snack)`)
})
CREATE (o)-[:CONTAINS]->(s);

// Customer REVIEWED Snack
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/customer_reviewed_snack.csv'
AS row
MATCH (c:Customer {
    customerId: toInteger(row.`:START_ID(Customer)`)
}),
(s:Snack {
    snackId: toInteger(row.`:END_ID(Snack)`)
})
CREATE (c)-[:REVIEWED {
    reviewId: toInteger(row.reviewId)
}]->(s);

// Customer RECEIVES Mail
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/customer_receives_mail.csv'
AS row
MATCH (c:Customer {
    customerId: toInteger(row.`:START_ID(Customer)`)
}),
(m:Mail {
    mailId: toInteger(row.`:END_ID(Mail)`)
})
CREATE (c)-[:RECEIVES]->(m);