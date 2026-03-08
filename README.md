#  MongoDB Commands & Syntax

---

##  Basic Commands

### 1. Connection and Database
```js
show dbs
use databaseName
show collections
```

### 2. Data Insertion
```js
db.collection.insertOne({name: "Gabriel", age: 25})
db.collection.insertMany([{name: "Ana"}, {name: "Carlos"}])
```

### 3. Queries (Find)
```js
db.collection.find()
db.collection.find({age: {$gt: 20}})
db.collection.findOne({name: "Gabriel"})
db.collection.countDocuments({status: "active"})
db.collection.find().limit(5)
db.collection.find().skip(10).limit(5)
db.collection.find().sort({age: -1})
```

### 4. Update
```js
db.collection.updateOne({name: "Gabriel"}, {$set: {age: 26}})
db.collection.updateMany({age: {$lt: 18}}, {$set: {status: "minor"}})
db.collection.replaceOne({name: "Gabriel"}, {name: "Gabriel", age: 27, status: "active"})
db.collection.updateOne({name: "Lucas"}, {$set: {age: 22}}, {upsert: true})
```

### 5. Deletion
```js
db.collection.deleteOne({name: "Carlos"})
db.collection.deleteMany({status: "inactive"})
```

### 6. Administrative Commands
```js
db.stats()
db.runCommand({ping: 1})
```

---

##  Query Operators

### Comparison
```js
{age: {$gte: 18}}
{age: {$in: [18, 21, 25]}}
{age: {$lte: 30}}
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
{age: {$ne: 18}}
{age: {$nin: [18, 21, 25]}}
{name: {$regex: "^G"}}
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
- `$match`  
- `$group`  
- `$sort`  
- `$project`  
- `$lookup`  
- `$unwind`  

### Advanced Stages
- `$facet` → run multiple pipelines in parallel  
- `$bucket` / `$bucketAuto` → group by ranges  
- `$merge` → save results into another collection  

---

##  Indexing
```js
db.collection.createIndex({name: 1})
db.collection.getIndexes()
db.collection.dropIndex("name_1")
```

---

##  User & Role Management
```js
db.createUser({user: "admin", pwd: "password", roles: ["readWrite", "dbAdmin"]})
show users
db.dropUser("admin")
```

---

##  Administrative & Utility
```js
db.dropDatabase()
db.collection.drop()
db.collection.renameCollection("newCollectionName")
db.serverStatus()
db.currentOp()
```

---

##  Advanced Features

### Array Operators
```js
db.collection.updateOne({name: "Gabriel"}, {$push: {hobbies: "coding"}})
db.collection.updateOne({name: "Gabriel"}, {$pull: {hobbies: "gaming"}})
db.collection.updateOne({name: "Gabriel"}, {$addToSet: {hobbies: "reading"}})
db.collection.find({hobbies: {$elemMatch: {$eq: "coding"}}})
```

### Transactions (replica set / cluster)
```js
session = db.getMongo().startSession()
session.startTransaction()
db.collection.insertOne({name: "Test"}, {session})
session.commitTransaction()
```

### Advanced Update Operators
```js
db.collection.updateOne({name: "Gabriel"}, {$inc: {age: 1}})
db.collection.updateOne({name: "Gabriel"}, {$unset: {status: ""}})
db.collection.updateOne({name: "Gabriel"}, {$rename: {"oldField": "newField"}})
```

---
