# Dockerfile

# Base image
FROM python:3.13-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y gcc libpq-dev build-essential \
    && apt-get clean

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /app/

# Collect static files (optional for prod)
RUN mkdir -p /app/staticfiles /app/media

# Default command (can be overridden)
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
