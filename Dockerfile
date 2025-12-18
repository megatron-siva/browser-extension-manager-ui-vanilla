FROM node:20-alpine

# Enable pnpm
RUN corepack enable

# Set working directory
WORKDIR /app

# Copy lock files first for better caching
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the source code
COPY . .

# Default command
CMD ["pnpm", "dev"]