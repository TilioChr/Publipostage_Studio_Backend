const express = require("express");
const { execSync } = require("child_process");
const cors = require("cors");
const path = require("path");
const fs = require("fs");
const bodyParser = require("body-parser");
const multer = require("multer");

const app = express();
const port = process.env.PORT || 3001;

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });
const uploadedFilesPath = path.join(__dirname, "public", "uploadedFiles");
const projectsPath = path.join(__dirname, "public", "projects");

app.use(cors());
app.use(bodyParser.json({ limit: "999mb" })); // Augmentez la limite des données XML à 500MB
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.post("/unload", (req, res) => {
  const message = req.body.message;
  console.log(`Page Unload : ${message}`);

  // Supprime tout les fichiers du dossier uploadedFiles
  try {
    const files = fs.readdirSync(uploadedFilesPath);
    files.forEach((file) => {
      const filePath = path.join(uploadedFilesPath, file);
      fs.unlinkSync(filePath);
      console.log(`Fichier ${file} supprimé avec succès`);
    });
    console.log("Tous les fichiers ont été supprimés avec succès");
  } catch (error) {
    console.error("Error deleting files:", error);
    res
      .status(500)
      .send(
        "Erreur lors du traitement de la requête : Suppression des fichiers du dossier uploadedFiles"
      );
  }

  // Supprime le contenu du fichier input.xml
  try {
    const cheminFichier = path.join(__dirname, "public", "input.xml");
    const newContent = `<!-- XML --><?xml version="1.0"?><Documents><Document><Empty>Empty</Empty></Document></Documents><!-- ENDXML -->`; // Ajoutez les données XML au fichier input.xml
    fs.writeFileSync(cheminFichier, newContent, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
    console.log("Contenu du fichier input.xml supprimé avec succès");
  } catch (error) {
    console.error("Error processing request:", error);
    res
      .status(500)
      .send(
        "Erreur lors du traitement de la requête : Suppression du contenu du fichier input.xml"
      );
  }

  // Supprime les caractères entre <!-- pdf --> et <!-- endpdf --> dans le fichier COURRIERSIMPLEBIS.dff
  try {
    const cheminFichier = path.join(
      __dirname,
      "public",
      "COURRIERSIMPLEBIS.dff"
    );
    let contenuActuel = fs.readFileSync(cheminFichier, "utf-8");
    contenuActuel = contenuActuel.replace(
      /<!-- pdf -->[\s\S]*?<!-- endpdf -->/g,
      "<!-- pdf --><!-- endpdf -->"
    ); // supprime le contenu des marqueurs
    fs.writeFileSync(cheminFichier, contenuActuel, "utf-8"); // Écrivez le nouveau contenu dans le fichier.
    console.log(
      "Pdf Background supprimé avec succès dans le fichier COURRIERSIMPLEBIS.dff"
    );
    res.send("Requête traitée avec succès");
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .send(
        "Erreur lors du traitement de la requête : Suppression des caractères entre <!-- pdf --> et <!-- endpdf --> dans le fichier COURRIERSIMPLEBIS.dff"
      );
  }
});

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

app.get("/dashboard", async (req, res) => {
  // Récupère le nom des fichiers du dossier projects et leurs images associées
  try {
    const files = fs.readdirSync(projectsPath);
    const projects = files.map((file) => {
      const filePath = path.join(projectsPath, file);
      const fileContent = fs.readFileSync(filePath, "utf-8");
      const fileContentJSON = JSON.parse(fileContent);
      const preview = fileContentJSON.preview;
      const attachedPDF = fileContentJSON.attachedPDF; // Récupère le nom du fichier PDF attaché !!!!!!!!!!!!!!!!!!!!!!!!!! A MODIFIER !!!!!!!!!!!!!!!!!!!!!!!!!!!!
      const attachedData = fileContentJSON.dataFileName;
      return {
        name: file,
        preview: preview,
        attachedPDF: attachedPDF,
        attachedData: attachedData,
      };
    });
    res.json(projects);
  } catch (error) {
    console.error(error);
    res.status(500).send("Erreur lors du traitement de la requête");
  }
});

app.post("/importXML", async (req, res) => {
  try {
    console.log("-------------- Requête reçue : importXML");
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

app.post("/uploadPdf", upload.single("pdfFile"), (req, res) => {
  const pdfFile = req.file;
  const filePath = path.join(
    __dirname,
    "public",
    "uploadedFiles",
    pdfFile.originalname
  );

  fs.writeFile(filePath, pdfFile.buffer, (err) => {
    if (err) {
      console.error("Error saving the PDF file:", err);
      res.status(500).send("Internal Server Error");
    } else {
      console.log("PDF file uploaded successfully.");

      const dffFilePath = path.join(
        __dirname,
        "public",
        "COURRIERSIMPLEBIS.dff"
      );
      const pdfFileName = pdfFile.originalname;
      const dffContent = fs.readFileSync(dffFilePath, "utf-8");
      const updatedDffContent1 = dffContent.replace(
        /<!-- pdf -->([\s\S]*?)<!-- endpdf -->/g,
        "<!-- pdf --><!-- endpdf -->"
      );
      const updatedDffContent2 = updatedDffContent1.replace(
        "<!-- pdf -->",
        `<!-- pdf -->background-image: url('uploadedFiles/${pdfFileName}');`
      );
      fs.writeFileSync(dffFilePath, updatedDffContent2, "utf-8");

      res.status(200).json({ message: "BGPDF write in DFF" });
    }
  });
});

app.get("/unloadPdf", (req, res) => {
  const dffFilePath = path.join(__dirname, "public", "COURRIERSIMPLEBIS.dff");
  const dffContent = fs.readFileSync(dffFilePath, "utf-8");
  const updatedDffContent = dffContent.replace(
    /<!-- pdf -->[\s\S]*?<!-- endpdf -->/g,
    "<!-- pdf --><!-- endpdf -->"
  );
  fs.writeFileSync(dffFilePath, updatedDffContent, "utf-8");
  res.status(200).json({ message: "BGPDF write in DFF" });
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

app.post("/save", upload.single("monFichier"), (req, res) => {
  const filePath = path.join(projectsPath, req.headers.name);
  fs.writeFile(filePath, JSON.stringify(req.body), (err) => {
    if (err) {
      console.error("Erreur lors de l'écriture du fichier:", err);
      res.status(500).send("Internal Server Error");
    } else {
      console.log("Fichier enregistré avec succès.");
      res.status(200);
    }
  });
});

app.post("/projectLoad", (req, res) => {
  const filePath = path.join(projectsPath, req.headers.name);
  console.log("filePath", filePath);
  fs.readFile(filePath, "utf-8", (err, data) => {
    if (err) {
      console.error("Erreur lors de la lecture du fichier:", err);
      res.status(500).send("Internal Server Error");
    } else {
      console.log("Fichier lu avec succès.");
      res.status(200).send(data);
    }
  });
});

app.post("/deleteProject", (req, res) => {
  const filePath = path.join(projectsPath, req.headers.name);
  fs.unlink(filePath, (err) => {
    if (err) {
      console.error("Erreur lors de la suppression du fichier:", err);
      res.status(500).send("Internal Server Error");
    } else {
      console.log("Fichier supprimé avec succès.");
      res.status(200).send("Fichier supprimé avec succès.");
    }
  });
});

app.listen(port, () => {
  console.log(`Serveur écoutant sur le port ${port}`);
});
