# Setup Instructions

## Install Elastic Search

### Add the repository to your sources

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

```
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
```
### Update your sources and install

```
sudo apt-get update && sudo apt-get install elasticsearch
```

Check [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html) for extra install info.

### Start the Elastic Search service

```
sudo -i service elasticsearch start
```

You can configure it so that it starts when the system boots using

```
sudo update-rc.d elasticsearch defaults 95 10
```

Visit http://localhost:9200/ You should see something like this (it takes a while [20+ seconds] for the server to actually start)

```JSON
{
  "name" : "HDFcKXt",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "283BwhdrTRu-LHD1G_wx0Q",
  "version" : {
    "number" : "5.5.0",
    "build_hash" : "260387d",
    "build_date" : "2017-06-30T23:16:05.735Z",
    "build_snapshot" : false,
    "lucene_version" : "6.6.0"
  },
  "tagline" : "You Know, for Search"
}
```

Now that Elastic Search is set up, we will use ElasticSearchHQ, an ES GUI manager.

```
git clone https://github.com/royrusso/elasticsearch-HQ
```

```
cd elasticsearch-HQ
```

Start a server using

```
python -m SimpleHTTPServer 8000
```

Add the following to your `elasticsearch.yml` file using

```
sudo nano /etc/elasticsearch/elasticsearch.yml
```

```yml
http.cors.enabled: true
http.cors.allow-origin: /https?:\/\/localhost(:[0-9]+)?/
http.cors.allow-credentials: true
http.cors.allow-headers: X-Requested-With,X-Auth-Token,Content-Type, Content-Length, Authorization
http.cors.allow-methods : OPTIONS, HEAD, GET, POST, PUT, DELETE
node.master: true
```

Restart the ES Service

```
sudo -i service elasticsearch restart
```

Visit http://localhost:8000/?url=http://localhost:9200

ElasticSearchHD's Control Panel should show up!