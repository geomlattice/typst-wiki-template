from .models import Article 
from django.db.models import Q
import requests
import xmltodict
import json
import copy

#source: https://joshkaramuth.com/blog/django-view-model/
class ArticleDetailViewModel:
    def __init__(self, article_title: str):
        self._article = self._get_article(article_title) 
        self._lastmod = self._get_lastmod()

    def _get_article(self, article_title):
        try:
            return Article.objects.get(Q(article_title=article_title))
        except Article.DoesNotExist:
            return None

    def _get_lastmod(self):
        if self._article:
            return self._article._lastmod
        return "sqrt(-1)"

    @property 
    def article_title(self) -> str:
        return self._article.article_title if self._article else "NO ARTICLE"

    @property
    def article_lastmod(self) -> str:
        return self._article.lastmod if self._article else "NOT MODDED"

class IndexGenerator:
    def __init__(self):
        self.jsonindex = self._update_index()

    def _update_index(self) -> str:
        #TODO: handle all processing here
        xmlreq = requests.get("https://geomlattice.github.io/typst-wiki-template/sitemap.xml") 
        #TODO: do not pass on raw data
        xmlreq.raise_for_status()
        xmldata = xmlreq.content.decode('utf-8') 
        #source: https://www.geeksforgeeks.org/python/python-xml-to-json/
        dictdata = xmltodict.parse(xmldata)
        jsondata = json.dumps(dictdata)
        #TODO: make a setter/getter structure
        return jsondata

    @property
    def jsondata(self):
        #return str(self.jsondata)
        return str(self.jsonindex)
    
    @property
    def indexlist(self):
        rawjson = json.loads(self.jsondata)
        #return json.loads(rawjson)
        full_list = rawjson["urlset"]["url"]
        
        def preprocess(json_item):
            data_before = copy.deepcopy(json_item)
            link_path = data_before["loc"]
            link_category, link_article = link_path.split("/")[-2:]
            #print(link_category, link_article)
            data_before["category"] = link_category
            #drop the `*.html`
            data_before["wikititle"] = link_article.split(".html")[0]
            return data_before

        processed_data = [preprocess(i) for i in full_list]
        return processed_data


