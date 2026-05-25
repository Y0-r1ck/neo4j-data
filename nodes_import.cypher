// Companies
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/companies.csv'
AS row
CREATE (:Company {
    companyId: toInteger(row.`companyId:ID(Company)`),
    name: row.name,
    country: row.country
});

// Snack Types
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/snack_types.csv'
AS row
CREATE (:SnackType {
    typeId: toInteger(row.`typeId:ID(SnackType)`),
    name: row.name
});

// Ingredients
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/ingredients.csv'
AS row
CREATE (:Ingredient {
    ingredientId: toInteger(row.`ingredientId:ID(Ingredient)`),
    name: row.name
});

// Allergies
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/allergies.csv'
AS row
CREATE (:Allergy {
    allergyId: toInteger(row.`allergyId:ID(Allergy)`),
    name: row.name,
    trigger: row.trigger
});

// Orders
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/orders.csv'
AS row
CREATE (:Order {
    orderId: toInteger(row.`orderId:ID(Order)`),
    date: date(row.date),
    total_price: toFloat(row.total_price),
    delivery_date: date(row.delivery_date)
});

// Mails
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/mails.csv'
AS row
CREATE (:Mail {
    mailId: toInteger(row.`mailId:ID(Mail)`),
    name: row.name,
    user: row.user,
    discount: toInteger(row.discount),
    text: row.text
});

// Reviews
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/Y0-r1ck/neo4j-data/refs/heads/main/reviews.csv'
AS row
CREATE (:Review {
    reviewId: toInteger(row.`reviewId:ID(Review)`),
    rating: toInteger(row.rating),
    review_text: row.review_text,
    review_time: date(row.review_time)
});