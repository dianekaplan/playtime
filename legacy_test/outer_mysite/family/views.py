from django.http import Http404
from django.shortcuts import render
from django.http import HttpResponse
from family.models import Family, Person

# Create your views here.
def index(request):
    family_list = Family.objects.order_by('caption')
    context=  { 'family_list': family_list}
    return render (request, 'family/index.html', context)

def detail(request, familyID):
    try: 
        Family.objects.get(pk=familyID)
    except Family.DoesNotExist:
        raise Http404("Family does not exist")

    #return HttpResponse("You're looking at family %s." % familyID)
    #return render (request, 'family/family.html', {'family': familyID})
    family_info = Family.objects.get(pk=familyID)
    context=  { 'family_info': family_info}
    return render (request, 'family/family.html', context)

# New stuff 5/16:
def person_index(request):
    person_list = Person.objects.order_by('last')
    context=  { 'person_list': person_list}
    return render (request, 'family/person_index.html', context)

def person_detail(request, personID):
    try: 
        Person.objects.get(pk=personID)
    except Person.DoesNotExist:
        raise Http404("Person does not exist")

    #return HttpResponse("You're looking at family %s." % familyID)
    #return render (request, 'family/person.html', {'person': personID})
    person_info = Person.objects.get(pk=personID)
    context=  { 'person_info': person_info}
    return render (request, 'family/person.html', context)

