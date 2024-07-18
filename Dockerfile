# Stage 1: Build
FROM node:16 as build

WORKDIR /app

# Copy both client and server package.json files
COPY client/package.json client/package-lock.json ./client/
COPY server/package.json server/package-lock.json ./server/

# Install dependencies
RUN cd client && npm install
RUN cd server && npm install

# Copy all files to build the client
COPY client/ ./client/

# Build the client
RUN cd client && npm run build

# Stage 2: Run
FROM node:16-alpine

WORKDIR /app

# Copy server files
COPY server/ ./server/
COPY --from=build /app/client/dist ./client/dist

# Expose port
EXPOSE 3000

# Start the server
CMD ["node", "server/server.js"]