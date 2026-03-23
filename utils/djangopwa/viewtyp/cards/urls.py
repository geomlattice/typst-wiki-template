from django.urls import path
from . import views

app_name = "cards"
urlpatterns = [
        path("", views.home, name="home"),
        path("<str:article_title>/", views.article_detail_view, name="article")
]
