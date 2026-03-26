from django.shortcuts import render, HttpResponse
from django.http import Http404
from .view_models import ArticleDetailViewModel, IndexGenerator 

# Create your views here.

def home(request):
    #return HttpResponse("hello world!")
    #view_model = update_index() 
    view_model = IndexGenerator() 
    #print(view_model.jsonindex)
    #print(view_model.indexlist)
    context = {
            'view_model': view_model
            }
    return render(request, 'cards/index.html', context)


def article_detail_view(request, article_title):
    view_model = ArticleDetailViewModel(article_title)
    #error handling....threw an error???
    #if not view_model.is_valid():
    #    raise Http404("Article does not exist")
    context = {
            'view_model': view_model
    }
    return render(request, 'cards/article_detail.html', context)
