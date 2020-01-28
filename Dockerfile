FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r /code/requirements.txt --src=/usr/local/src
COPY p20 /code/
RUN echo $(ls)
