# Jina-app-store-search

This is a simple example using the [Jina](https://github.com/jina-ai/jina/) neural search framework. And this is from alex's [link](https://github.com/alexcg1/jina-app-store-example). This is a repository created to modify docker files and indexes to reflect my project. 
<br>
Data set used: [17K Mobile Strategy Games dataset](https://www.kaggle.com/tristan581/17k-apple-app-store-strategy-games) from kaggle

## Instructions

[![Run on Ainize](https://ainize.ai/images/run_on_ainize_button.svg)](https://ainize.web.app/redirect?git_repo=https://github.com/msh1273/jina-Appstore-search)

### Clone this repo

```shell
git clone https://github.com/msh1273/jina-Appstore-search.git
cd jina-Appstore-search
```

### Create a virtual environment (optional)

We wouldn't want our project clashing with our system libraries, now would we?

```shell
virtualenv env --python=python3.8 # Python versions >= 3.7 work fine
source env/bin/activate
```
### Get the dataset

```shell
python get_data.py
```

This command creates a directory called `data` and downloads the [17K Mobile Strategy Games dataset](https://www.kaggle.com/tristan581/17k-apple-app-store-strategy-games) into it. It then shuffles it to ensure we get a diverse range of apps to search through.

💡 **Tip**: We shuffle using a fixed random seed of `42`, so every shuffle will be the same. Want a different shuffle? Change it in [`backend_config.py`](./backend/backend_config.py)

### Install everything

Make sure you're in your virtual environment first!

```shell
pip install -r requirements.txt
```

### Index your data

```shell
python app.py -t index -n 1000
```

💡 **Tip**: Use `-n` to specify number of apps to index

### Search your data

`app.py` accepts an input query via a REST gateway:

```shell
python app.py -t query_restful
```
### Search from the terminal

```shell
curl --request POST -d '{"top_k":15,"mode":"search","data":["hello world"]}' -H 'Content-Type: application/json' 'https://main-jina-appstore-search-msh1273.endpoint.ainize.ai/search'
```

Where `hello world` is your query.

Results may not be accurate as the number of documents currently indexed in the workspace is 3000 lines. For more accurate results, increase the number of documents to be indexed!

## FAQ

### Why this dataset?

It contains a lot of metadata, including (working) links to icons. I want to build a nice front-end to show off the search experience so graphical assets are vital. Plus stuff like ratings, descriptions, the works.

### The download/purchase buttons don't do anything

This is just a demo search engine. It has no functionality beyond that. 

### How can I change basic settings?

Edit `backend/backend_config.py`

## Part to be corrected
Currently the part for top_k cannot be specified in the query. (fixed at 15)