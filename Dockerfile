FROM zhh1115/python36-alpine:latest

RUN pip install requests

COPY entrypoint.py /entrypoint.py

RUN chmod +x /entrypoint.py

ENTRYPOINT ["python3", "/entrypoint.py"]