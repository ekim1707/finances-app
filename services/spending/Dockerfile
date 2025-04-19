FROM python:3.9-slim
WORKDIR /app

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port
EXPOSE 5000

# Use Gunicorn for production instead of Flask's built-in server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
