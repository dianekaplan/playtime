from django.contrib import admin

# Register your models here.
from family.models import Family
from family.models import Person

admin.site.register(Family)
admin.site.register(Person)
