
# Use a lightweight Python base image
FROM python:3.9-slim

# Prevent Python from creating .pyc files and enable logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy application files
COPY requirements.txt .
COPY app.py .
COPY templates ./templates
COPY static ./static

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Document the container's application port
EXPOSE 5000

# Run Flask on all interfaces inside the container
CMD ["python", "app.py"]
