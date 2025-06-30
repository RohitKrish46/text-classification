# instructions for building a Docker image for a Flask application
FROM python:3.10-slim

# set the working directory in the container to /app
WORKDIR /app

# copy all files from the flask_app to /app in the container
COPY flask_app/ /app/

# copy the vectorizer model to the /app/models directory
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

# install system dependencies
RUN pip install -r requirements.txt

# install nltk data dependencies
RUN python -m nltk.downloader stopwords wordnet

# expose port 5000 to allow access to the Flask app
EXPOSE 5000

# run the Flask application
CMD ["python", "app.py"]