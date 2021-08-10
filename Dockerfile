FROM mhart/alpine-node:14 as builder
ENV NODE_ENV="production"
RUN npm i -g pnpm
# Copy app's source code to the /app directory
WORKDIR /app

COPY . /app

# The application's directory will be the working directory

# RUN yarn set version berry
# Install Node.js dependencies defined in '/app/package.json'
RUN pnpm install

FROM mhart/alpine-node:14
ENV NODE_ENV="production"
COPY --from=builder /app /app
WORKDIR /app
ENV PORT 3000
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]