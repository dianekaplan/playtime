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
    return render (request, 'family/family.html', {'family': familyID})

