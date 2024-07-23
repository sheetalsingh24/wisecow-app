FROM ubuntu:latest

# Set PATH if necessary
ENV PATH="/usr/games:${PATH}"

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    cowsay \
    fortune-mod \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the script
WORKDIR /usr/src/app

# Copy the wisecow.sh script into the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Expose port 8080
EXPOSE 8080

# Define the command to run the script
CMD ["./wisecow.sh"]

