# Use a lightweight Python base image
FROM python:3.9-slim

# Set the environment to development
ENV FLASK_ENV=development

# Set room path environment variable
ENV ROOMS_PATH="/app/rooms"

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code into the container
COPY . .

# Install the required packages
RUN pip install -r requirements.txt

# Expose the port your application will run on
EXPOSE 5000

# Start the Flask application
CMD ["python", "chatApp.py"]
