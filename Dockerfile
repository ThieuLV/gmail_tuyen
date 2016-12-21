#Base Image for Golang Project
FROM python:2.7
#Port Number to expose from docker container to host server
EXPOSE 8888
#Working directory path where your code exists
WORKDIR /usr/src/app
#Copy source from host machine to docker container
ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /usr/src/app
#Adding permission to access .shipped folder
RUN chmod a+x .gmail/__init__.py .gmail/exceptions.py .gmail/gmail.py .gmail/mailbox.py .gmail/message.py .gmail/utf.py .gmail/utils.py
#provide your build/run commands
RUN [".gmail/__init__.py"]
CMD .gmail/__init__.py
