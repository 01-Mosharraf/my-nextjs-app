# Builder
FROM node:18-alpine AS builder
WORKDIR /app
RUN apk add --no-cache python3 make g++ libc6-compat
COPY package.json package-lock.json* ./
RUN npm ci
COPY . .
RUN npm run build

# Runner
FROM node:18-alpine AS runner
WORKDIR /app
COPY package.json package-lock.json* ./
ENV NODE_ENV production
RUN npm ci
COPY --from=builder /app/.next .next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.mjs ./next.config.mjs
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npx", "next", "start", "-p", "3000"]
