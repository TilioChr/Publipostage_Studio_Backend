const express = require("express");
const { execSync } = require("child_process");
const cors = require("cors");
const path = require("path");
const fs = require("fs");
const bodyParser = require("body-parser");

const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(bodyParser.json({ limit: "500mb" })); // Augmentez la limite des données XML à 500MB
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.get("/deleteContent", async (req, res) => {
  try {
    const cheminFichier = path.join(
      __dirname,
      "public",
      "COURRIERSIMPLEBIS.dff"
    );
    let contenuActuel = fs.readFileSync(cheminFichier, "utf-8");
    contenuActuel = contenuActuel.replace(
      /<!-- #Content -->[\s\S]*?<!-- #EndContent -->/g,
      "<!-- #Content --><!-- #EndContent -->"
    ); // supprime le contenu des marqueurs
    fs.writeFileSync(cheminFichier, contenuActuel, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
    res.send("Requête traitée avec succès");
  } catch (error) {
    console.error(error);
    res.status(500).send("Erreur lors du traitement de la requête");
  }
});

app.post("/importXML", async (req, res) => {
  try {
    const cheminFichier = path.join(__dirname, "public", "input.xml");
    const xmlData = req.body.xml; //recupère les données XML
    const newContent = `<!-- XML -->${xmlData}<!-- ENDXML -->`; // Ajoutez les données XML au fichier input.xml
    fs.writeFileSync(cheminFichier, newContent, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
    res.send("Requête traitée avec succès");
  } catch (error) {
    console.error("Error processing request:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.post("/completDFF", async (req, res) => {
  const cheminFichier = path.join(__dirname, "public", "COURRIERSIMPLEBIS.dff"); // Récupérez le chemin vers le fichier.

  // ajoute le texte
  if (req.body.type === "text") {
    const message = req.body.message; // Récupérez le message à ajouter au fichier.

    let contenuActuel = fs.readFileSync(cheminFichier, "utf-8"); // Lisez le contenu actuel du fichier.
    const indexChaine = contenuActuel.indexOf("<!-- #Content -->"); // Recherchez l'index de la chaîne "<!-- #Content -->".

    // Si la chaîne est trouvée, insérez votre nouveau message après cette position.
    if (indexChaine !== -1) {
      const debut = contenuActuel.substring(
        0,
        indexChaine + "<!-- #Content -->".length
      );
      const fin = contenuActuel.substring(
        indexChaine + "<!-- #Content -->".length
      );
      contenuActuel = debut + message + fin;
      fs.writeFileSync(cheminFichier, contenuActuel, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
      res.send("Requête traitée avec succès");
    } else {
      res.status(400).send("Chaîne spécifiée non trouvée dans le fichier");
    }
  }

  // ajoute les images
  if (req.body.type === "image") {
    const image = req.body.image; // Récupérez le message à ajouter au fichier.
    const imageX = req.body.imageX;
    const imageY = req.body.imageY;
    const imageSize = req.body.imageSize;

    let contenuActuel = fs.readFileSync(cheminFichier, "utf-8"); // Lisez le contenu actuel du fichier.
    const indexChaine = contenuActuel.indexOf("<!-- #Content -->"); // Recherchez l'index de la chaîne "<!-- #Content -->".

    const insert = `<div style="position:absolute; left:${imageX}mm; top:${imageY}mm; width:${imageSize}%;"><img width="100%" src="${image}"/></div>`;

    // Si la chaîne est trouvée, insérez votre nouveau message après cette position.
    if (indexChaine !== -1) {
      const debut = contenuActuel.substring(
        0,
        indexChaine + "<!-- #Content -->".length
      );
      const fin = contenuActuel.substring(
        indexChaine + "<!-- #Content -->".length
      );
      contenuActuel = debut + insert + fin;
      fs.writeFileSync(cheminFichier, contenuActuel, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
      res.send("Requête traitée avec succès");
    } else {
      res.status(400).send("Chaîne spécifiée non trouvée dans le fichier");
    }
  }

  // ajoute les barcodes/QRCodes
  if (req.body.type === "barcode") {
    const barcode = req.body.barcode;
    const barcodeX = req.body.barcodeX;
    const barcodeY = req.body.barcodeY;
    const barcodeSizeX = req.body.barcodeSizeX;
    const barcodeSizeY = req.body.barcodeSizeY;
    let contenuActuel = fs.readFileSync(cheminFichier, "utf-8"); // Lisez le contenu actuel du fichier.
    const indexChaine = contenuActuel.indexOf("<!-- #Content -->"); // Recherchez l'index de la chaîne "<!-- #Content -->".

    const insert = `<div style="position:absolute; left:${barcodeX}mm; top:${barcodeY}mm;"><img width="${barcodeSizeX}mm" height="${barcodeSizeY}mm" src="${barcode}"/></div>`;

    // Si la chaîne est trouvée, insérez votre nouveau message après cette position.
    if (indexChaine !== -1) {
      const debut = contenuActuel.substring(
        0,
        indexChaine + "<!-- #Content -->".length
      );
      const fin = contenuActuel.substring(
        indexChaine + "<!-- #Content -->".length
      );
      contenuActuel = debut + insert + fin;
      fs.writeFileSync(cheminFichier, contenuActuel, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
      res.send("Requête traitée avec succès");
    } else {
      res.status(400).send("Chaîne spécifiée non trouvée dans le fichier");
    }
  }
});

app.get("/runExecutable", (req, res) => {
  console.log("Exécution de l'exécutable");
  const cheminFichierBatch = path.join(__dirname, "public", "exec_engine.bat");
  try {
    execSync(cheminFichierBatch);
    console.log("Exécution de l'exécutable terminée");
    const pdfFilePath = path.join(__dirname, "public/out", "pdfOutput.pdf");
    res.sendFile(pdfFilePath);
  } catch (error) {
    console.error("Erreur lors de l'exécution de l'exécutable:", error.message);
    res.status(500).send("Internal Server Error");
  }
});

app.listen(port, () => {
  console.log(`Serveur écoutant sur le port ${port}`);
});
