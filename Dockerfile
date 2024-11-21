# Use an official Python 3.11.4 image as the base
FROM python:3.14.0a1

# Set a working directory within the container
WORKDIR /app

# Clone the TorBot repository from GitHub
RUN git clone https://github.com/DedSecInside/TorBot.git /app

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install TorBot dependencies using Poetry
RUN cd /app && poetry install

# Expose the port specified in the .env file
EXPOSE $SOCKS5_PORT

# Example way to run the container:
# docker run --network="host" your-image-name poetry run python torbot -u https://www.example.com --depth 2 --visualize tree --save json
