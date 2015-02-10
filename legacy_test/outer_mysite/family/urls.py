from django.conf.urls import patterns, url

from family import views

urlpatterns = patterns('', 
    # ex: /family/
    url(r'^$', views.index, name='index'), 
    # ex: /family/5/
    url(r'^(?P<familyID>\d+)/$', views.detail, name='detail'),   
)
