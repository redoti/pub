# syntax=docker/dockerfile:1

FROM python:3.10.14-slim

WORKDIR /pothole-detection

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .  

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0:5000"]