from django.conf.urls import patterns, url

from family import views

urlpatterns = patterns('', 
    # ex: /family/
    url(r'^$', views.index, name='index'), 
    # ex: /family/5/
    url(r'^(?P<familyID>\d+)/$', views.detail, name='detail'), 
    # ex: /person/
    url(r'^person/$', views.person_index, name='person_index'), 
    # ex: /person/5/
    url(r'^person/(?P<personID>\d+)/$', views.person_detail, name='person_detail'),  
)
