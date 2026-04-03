FROM python:3.12-slim

# Prevent Python from writing .pyc files and using stdout/stderr buffering
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=volleyball_manager.settings \
    DJANGO_DEBUG=False \
    DJANGO_ALLOWED_HOSTS="*" \
    PORT=8000

WORKDIR /app

# Install system deps (if any)
RUN apt-get update && apt-get install -y --no-install-recommends build-essential && rm -rf /var/lib/apt/lists/*

# Install Python deps first to leverage Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY . .

# Add entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port the app runs on
EXPOSE 8000

# Run migrations then start Gunicorn (exec form handles signals cleanly)
CMD ["/app/entrypoint.sh"]
