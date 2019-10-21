# The first instruction is what image to base our container on.
# This is the oficial python 3.8 image
FROM python:3.8

# Avoid standard output buffering
ENV PYTHONUNBUFFERED 1

# Every "RUN" command is by default `/bin/sh -c` on linux
RUN mkdir /app

# `cd` into this directory
WORKDIR /app

# Copy from the file `requirements.txt` from the host into the 
# container
COPY requirements.txt /app/

# I don't need to explain this one, do I?
RUN pip install -r requirements.txt

# Copy the current directory from the host into the container
COPY . /app/

# Apply migrations
RUN python manage.py migrate

# Run the dev server on port 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]