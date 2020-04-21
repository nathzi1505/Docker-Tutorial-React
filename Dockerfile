## BUILD STEP
# Use an existing docker image as a base
FROM node:alpine as builder

# Set the working directory
WORKDIR '/app'

# Copy the package.json the container file system
COPY ./package.json ./

# Download and install all dependencies
RUN npm install

# Minimize cache busting and rebuilds
# Copy the entire file contnets to the container file system
COPY ./ ./

# Start the node server
RUN ["npm", "run", "build"]


## RUN STEP
# Use an existing docker image as a base
FROM nginx 

# Expose the port 80
EXPOSE 80

# Copy the build contents from the builder container file system
COPY --from=builder /app/build /usr/share/nginx/html