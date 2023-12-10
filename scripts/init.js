db = db.getSiblingDB('myDatabase');

db.createUser(
    {
        user: "myUser",
        pwd: "myPassword",
        roles: [
            {
                role: "readWrite",
                db: "myDatabase"
            }
        ]
    }
);

db.myCollection.insert({ name: 'test' });