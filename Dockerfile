# Use official Playwright image
FROM mcr.microsoft.com/playwright:v1.44.0-focal

# Set working directory
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Install Playwright browsers
RUN npx playwright install

# --- Install Microsoft Edge ---
RUN wget https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list' \
 && apt update \
 && apt install -y microsoft-edge-stable

# Default command to run tests
CMD ["npx", "playwright", "test"]