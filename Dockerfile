# Image de base Node.js légère
FROM node:20-alpine

# Informations sur le projet
LABEL maintainer="Mathieu FENOUIL"
LABEL description="Premier projet CI/CD DevOps"

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de dépendances en premier (optimisation cache)
COPY package*.json ./

# Installer les dépendances (production seulement)
RUN npm install --production

# Copier le reste du code source
COPY . .

# Port exposé (optionnel pour ce projet)
EXPOSE 3000

# Commande de démarrage
CMD ["node", "index.js"]