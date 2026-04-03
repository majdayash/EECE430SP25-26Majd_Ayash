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

# Expose port the app runs on
EXPOSE 8000

# Run database migrations then start Gunicorn
CMD python manage.py migrate --noinput && \\\n    gunicorn volleyball_manager.wsgi:application --bind 0.0.0.0:${PORT}
