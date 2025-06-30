# Step 1: Build the Next.js app
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Step 2: Serve using a lightweight server
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app ./
RUN npm install --omit=dev
EXPOSE 3000
CMD ["npm", "start"]
