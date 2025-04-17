# Utilise l'image du node.js 
FROM node:20

#Creation d'un Répertoire de travail
WORKDIR /usr/src/app

#COPIE DU FICHIER DU PROJET 
COPY . .

#INSTALLATION DE DEPENDANCES 
RUN npm install

#EXECUTION SOUS LE PORT 3000
EXPOSE 3000

#LANCEMENT DE APPS 
CMD ["node", "app.js"]
