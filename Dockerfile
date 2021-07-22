FROM jinaai/jina:2.0-standard
ARG docs_to_index=100
RUN apt-get update && apt-get -y install wget git 
RUN pip install torch>=1.1.0 transformers>=4.5.1
COPY . /workspace
WORKDIR /workspace
RUN pip install -r requirements.txt && python get_data.py && python app.py -t index -n $docs_to_index
ENTRYPOINT ["python", "app.py" , "-t", "query_restful"]