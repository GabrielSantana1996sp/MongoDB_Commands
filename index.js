const express = require ("express");
const {	MongoClient, ObjectId} = require("mongodb");

const app =  express ();
app.use (express.json);

//conexão com MongoDBLocal
const url = "mongodb://localhost:27017";
const client =  new MongoClient(url);
const dbName = "mongoCheatsheet";

//Endpont GitHub 
app.get("/github",(req, res)=>{
	res.json({
	 repo : "https://github.com/GabrielSantana1996sp/MongoDB_Commands",
	     bson: "https://github.com/GabrielSantana1996sp/MongoDB_Commands/blob/efa40605a075404da6bd77e990f3aa851c5b72bc/MongoDB.bson"
	});
});

//Crud de Comandos 
app.get("/comandos", async (req, res)=>{
  const db = client.db(dbName);
  const commands =  await db.collection("commands").find().toArray();
  res.json(commands);
});

app.post("/comandos", async (req, res)=>{
  const db = client.db(dbName);
  const result = await db.collection("commands").insertOne(req.body);
  res.json(result);
});

app.put("/commands/:id", async (req, res)=>{
  const db = client.db(dbName);
  const result = await db.collection("commands").updateOne(
   { _id: new ObjectId(req.params.id) },
   { $set:req.body }
);
});

app.delete("/comandos/:id", async (req, res)=>{
  const db = client.db(dbName);
  const result = await db.collection("commands").deleteOne({_id: new ObjectId(req.parans.id) });
   res.json(result);
});

app.listen(3000, async ()=>{
	await client.connect();
		console.log("Servidor rodando na porta 3000")
});



//node index.js

//localhost:3000














