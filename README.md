---

#  MongoDB Commands & Syntax

---

## 🔹 Basic Commands

### 1. Connection and Database
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

### 2. Data Insertion
- Insert a single document:
```js
db.collection.insertOne({name: "Gabriel", age: 25})
```

- Insert multiple documents:
```js
db.collection.insertMany([{name: "Ana"}, {name: "Carlos"}])
```

---

### 3. Queries (Find)
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

- Count documents:
```js
db.collection.countDocuments({status: "active"})
```

- Limit results:
```js
db.collection.find().limit(5)
```

- Skip results (pagination):
```js
db.collection.find().skip(10).limit(5)
```

- Sort results:
```js
db.collection.find().sort({age: -1})
```

---

### 4. Update
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

- Replace document:
```js
db.collection.replaceOne(
  {name: "Gabriel"},
  {name: "Gabriel", age: 27, status: "active"}
)
```

- Upsert (update or insert if not exists):
```js
db.collection.updateOne(
  {name: "Lucas"},
  {$set: {age: 22}},
  {upsert: true}
)
```

---

### 5. Deletion
- Delete one document:
```js
db.collection.deleteOne({name: "Carlos"})
```

- Delete multiple documents:
```js
db.collection.deleteMany({status: "inactive"})
```

---

### 6. Administrative Commands
- View database statistics:
```js
db.stats()
```

- Run commands directly:
```js
db.runCommand({ping: 1})
```

---

##  Query Operators

### Comparison
```js
{age: {$gte: 18}}          // greater or equal
{age: {$in: [18, 21, 25]}} // in list
{age: {$lte: 30}}          // less than or equal
```

### Logical
```js
{$and: [{age: {$gt: 18}}, {status: "active"}]}
{$or: [{city: "SP"}, {city: "RJ"}]}
```

### Element
```js
{field: {$exists: true}}
{field: {$type: "string"}}
```

### Extra Operators
```js
{age: {$ne: 18}}                 // not equal
{age: {$nin: [18, 21, 25]}}      // not in list
{name: {$regex: "^G"}}           // regex pattern
```

---

##  Aggregation Framework

### Pipeline Example
```js
db.collection.aggregate([
  {$match: {status: "active"}},
  {$group: {_id: "$city", total: {$sum: 1}}},
  {$sort: {total: -1}}
])
```

### Useful Stages
- `$match` → filter documents  
- `$group` → group and aggregate  
- `$sort` → order results  
- `$project` → reshape documents  
- `$lookup` → perform joins  
- `$unwind` → expand arrays  

---

##  Indexing
- Create index:
```js
db.collection.createIndex({name: 1})
```

- List indexes:
```js
db.collection.getIndexes()
```

- Drop index:
```js
db.collection.dropIndex("name_1")
```

---

##  User & Role Management
- Create user:
```js
db.createUser({
  user: "admin",
  pwd: "password",
  roles: ["readWrite", "dbAdmin"]
})
```

- List users:
```js
show users
```

- Drop user:
```js
db.dropUser("admin")
```

---

##  Administrative & Utility
- Drop database:
```js
db.dropDatabase()
```

- Drop collection:
```js
db.collection.drop()
```

- Rename collection:
```js
db.collection.renameCollection("newCollectionName")
```

- Server status:
```js
db.serverStatus()
```

- Current operations:
```js
db.currentOp()
```

---
