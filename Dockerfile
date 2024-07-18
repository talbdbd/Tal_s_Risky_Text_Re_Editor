# Use the official Node.js image.
FROM node:14

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the client-side code.
RUN npm run build

# Expose the port the app runs on.
EXPOSE 3000

# Start the server.
CMD ["npm", "start"]
