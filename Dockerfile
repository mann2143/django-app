# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY req.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r req.txt

# Copy the rest of the application code to the container
COPY . .

# Set the environment variable to tell Django which settings module to use
#ENV DJANGO_SETTINGS_MODULE=myproject.settings.production

# Set the command to run when the container starts
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "shoppinglyx.wsgi:application"]
