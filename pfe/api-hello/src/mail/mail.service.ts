import { Injectable } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { Produits } from 'src/produit/produit.entity';

@Injectable()
export class MailerService {
  async sendShareEmail(sendUser : string,mdp : string,recipientEmail: string, listName: string, products: string[]): Promise<void> {
    // Configuration du transporteur de messagerie
    const transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com', // Adresse du serveur SMTP
      port: 465, // Port SMTP
      secure: true, // Utilisation du protocole SSL/TLS (true pour le port 465, false pour les autres ports)
      auth: {
        user: sendUser, // Votre adresse e-mail fictive 'loulousousou284@gmail.com'
        pass: mdp, // Votre mot de passe fictif 'rwpppdpaifqvigki'
      },
    });
    

    let productList = '';
  for (const product of products) {
    productList += `<li>${product}</li>`;
  }

  // Corps de l'e-mail
  const emailBody = `
    <h1>Liste de partage</h1>
    <p>Vous avez reçu une liste de partage "${listName}". Voici les produits inclus :</p>
    <ul>
      ${productList}
    </ul>`;

    // Options de l'e-mail
    const mailOptions = {
      from: sendUser, // L'adresse e-mail de l'expéditeur
      to: recipientEmail, // L'adresse e-mail du destinataire
      subject: 'Liste de partage', // Objet de l'e-mail
      html: emailBody, // Corps de l'e-mail au format HTML
    };

    // Envoi de l'e-mail
    await transporter.sendMail(mailOptions);
  }
}
