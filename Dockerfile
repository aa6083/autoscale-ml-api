<<<<<<< HEAD
FROM python:3.10-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

EXPOSE 8000

=======
FROM python:3.10-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

EXPOSE 8000

>>>>>>> ec9b5f5de26eff0a767786312ed671ea8ee9b28c
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]