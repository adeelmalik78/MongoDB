// c
db = db.getSiblingDB( 'mydb' );
db.createCollection('orders');

// changeset id=1.2
db = db.getSiblingDB( 'mydb' );
db.createCollection('person2');

// changeset id=2
db = db.getSiblingDB( 'mydb' );
db.createCollection('company');

// changeset id=books
db.createCollection('books');

// changeset id=insert_products
db.products.insertMany( [
    { item: "card", qty: 15 },
    { item: "envelope", qty: 20 },
    { item: "stamps" , qty: 30 }
] );

// changeset id=insert_MongoDB_Tutorial
db.books.insertOne({ 
    title: 'MongoDB Tutorial',
    isbn: '0-8888-8888-8'
});

// changeset id=car
db.cars.insertMany ([
    { _id: 1, name: "Alto", color: "Red",cno: "H410",speed:40,mfdcountry: "India"},
    { _id: 2, name: "Polo", color: "White",cno: "H411",speed:45,mfdcountry: "Japan" },
    { _id: 3, name: "Audi", color: "Black",cno: "H412",speed:50,mfdcountry: "Germany" }
    ]);

// changeset id=findAndModify_car
db.car.findAndModify({
    query: { name: "Alto" },
    sort: { cno: 1 },
    update: { $inc: { speed: 100 } },
});