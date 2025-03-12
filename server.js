const express = require('express');
const app = express();
const PORT = 3000;
const exec = require('child_process').exec;

// Middleware para analizar el cuerpo de las solicitudes
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.get('/', (req, res) => {
  res.send('HOLA PAYOSSSS');
});


app.get("/run", (req, res) => {
  exec('touch test', (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
    console.error(`stderr: ${stderr}`);
  });
  res.send('Script ejecutado');
});

app.post("/recon", (req, res) => {
  const domain = req.body.domain || req.query.domain;
  const API_KEY = req.body.API_KEY || req.query.API_KEY;

  console.log(`Domain: ${domain}`);
  console.log(`API_KEY: ${API_KEY}`);
  if(API_KEY !== '1234'){
    return res.status(403).send('Unauthorized')
  } else { 
  exec(`./recon.sh ${domain} > resultado`, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    } else {
      console.error(`stderr: ${stderr}`);
      console.log(`stdout: ${stdout}`);
      res.send('Script ejecutado');
    }
  });
  }
});


app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});


