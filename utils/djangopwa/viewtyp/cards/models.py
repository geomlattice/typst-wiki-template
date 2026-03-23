from django.db import models

# Create your models here.

class Article(models.Model):
    article_title = models.CharField(max_length=200)
    lastmod = models.DateTimeField()
