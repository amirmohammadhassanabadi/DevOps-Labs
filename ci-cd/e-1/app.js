const express = require('express');
const app = express();

app.get("/", (req, res)=>{res.json({status: "ok", code: "200", message: "everything working"})});

app.listen(3001, ()=> {
	console.log(`server started on port: 3001`);
})