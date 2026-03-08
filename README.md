# MongoDB_Commands
MongoDB_syntax  

---

# MongoDB Basic Commands

## 1. Connection and Database
- Show available databases:
```js
show dbs
```

- Select/create a database:
```js
use databaseName
```

- Show collections in the current database:
```js
show collections
```

---

## 2. Data Insertion
- Insert a single document:
```js
db.collection.insertOne({name: "Gabriel", age: 25})
```

- Insert multiple documents:
```js
db.collection.insertMany([{name: "Ana"}, {name: "Carlos"}])
```

---

## 3. Queries (Find)
- Find all documents:
```js
db.collection.find()
```

- Find with filter:
```js
db.collection.find({age: {$gt: 20}})
```

- Find a single document:
```js
db.collection.findOne({name: "Gabriel"})
```

---

## 4. Update
- Update one document:
```js
db.collection.updateOne(
  {name: "Gabriel"},
  {$set: {age: 26}}
)
```

- Update multiple documents:
```js
db.collection.updateMany(
  {age: {$lt: 18}},
  {$set: {status: "minor"}}
)
```

---

## 5. Deletion
- Delete one document:
```js
db.collection.deleteOne({name: "Carlos"})
```

- Delete multiple documents:
```js
db.collection.deleteMany({status: "inactive"})
```

---

## 6. Administrative Commands
- View database statistics:
```js
db.stats()
```

- Run commands directly:
```js
db.runCommand({ping: 1})
```

---
