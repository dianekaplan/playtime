from django.db import models

# Create your models here.
class Person(models.Model): 
    first = models.CharField(max_length=200)
    middle = models.CharField(max_length=200)
    last = models.CharField(max_length=200)

class Family(models.Model):
    caption = models.CharField(max_length=200)
    motherID = models.ForeignKey(Person)
    marriageDate = models.DateTimeField('anniversary')
