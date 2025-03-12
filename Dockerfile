FROM python:3.10-alpine

WORKDIR /code

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install dependencies
RUN apk add --no-cache gcc musl-dev linux-headers libffi-dev openssl-dev

# Copy only requirements first for caching
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the code
COPY . .

# Expose port
EXPOSE 5000

# Run Flask in debug mode for live reloading
CMD ["flask", "run", "--debug"]
