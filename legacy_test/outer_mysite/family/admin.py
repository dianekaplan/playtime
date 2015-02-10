from django.contrib import admin
from family.models import Family, Person, Image, Image_person, Note, Info, Info_person, User, User_update

# Register your models here.

admin.site.register(Family)
admin.site.register(Person)
admin.site.register(Image)
admin.site.register(Image_person)
admin.site.register(Note)
admin.site.register(Info)
admin.site.register(Info_person)
admin.site.register(User)
admin.site.register(User_update)
