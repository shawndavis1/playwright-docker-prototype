# Modern Playwright image
FROM mcr.microsoft.com/playwright:v1.58.0-jammy

WORKDIR /app

# Upgrade npm to latest to avoid lockfile issues
RUN npm install -g npm@11

# Copy dependency files first (better caching)
COPY package*.json ./

# Install dependencies (dev included)
RUN npm ci --include=dev

# Copy the rest of the project
COPY . .

# Default command to run tests
CMD ["npx", "--yes", "playwright", "test"]