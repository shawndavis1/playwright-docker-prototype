# Dockerfile
FROM mcr.microsoft.com/playwright:v1.58.0-jammy

WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install dev dependencies
RUN npm ci --include=dev

# Copy the rest of the project
COPY . .

# CMD that works inside Linux container
CMD ["npx", "playwright", "test", "--reporter=html,junit"]