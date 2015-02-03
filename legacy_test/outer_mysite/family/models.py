# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models

class People(models.Model):
    personid = models.IntegerField(db_column='personID', primary_key=True)  # Field name made lowercase.
    first = models.CharField(max_length=15, blank=True)
    middle = models.CharField(max_length=15, blank=True)
    last = models.CharField(max_length=15, blank=True)
    maiden = models.CharField(max_length=15, blank=True)
    nickname = models.CharField(max_length=15, blank=True)
    face = models.CharField(max_length=50, blank=True)
    siblingseq = models.IntegerField(db_column='siblingSeq', blank=True, null=True)  # Field name made lowercase.
    keembool = models.IntegerField(db_column='KeemBool', blank=True, null=True)  # Field name made lowercase.
    husbandbool = models.IntegerField(db_column='HusbandBool', blank=True, null=True)  # Field name made lowercase.
    kemlerbool = models.IntegerField(db_column='KemlerBool', blank=True, null=True)  # Field name made lowercase.
    kaplanbool = models.IntegerField(db_column='KaplanBool', blank=True, null=True)  # Field name made lowercase.
    interests = models.CharField(max_length=255, blank=True)
    education = models.CharField(max_length=250, blank=True)
    work = models.CharField(max_length=255, blank=True)
    notes1 = models.CharField(max_length=255, blank=True)
    notes2 = models.CharField(max_length=255, blank=True)
    notes3 = models.CharField(max_length=255, blank=True)
    birthdate = models.CharField(max_length=15, blank=True)
    birthplace = models.CharField(max_length=100, blank=True)
    deathdate = models.CharField(max_length=15, blank=True)
    gender = models.CharField(db_column='Gender', max_length=1, blank=True)  # Field name made lowercase.
    origin = models.CharField(max_length=85, blank=True)
    firstfamily = models.IntegerField(db_column='firstFamily', blank=True, null=True)  # Field name made lowercase.
    currentlocation = models.CharField(db_column='currentLocation', max_length=50, blank=True)  # Field name made lowercase.
    adoptedbool = models.IntegerField(db_column='adoptedBool', blank=True, null=True)  # Field name made lowercase.
    directbool = models.IntegerField(db_column='directBool', blank=True, null=True)  # Field name made lowercase.
    hidebool = models.IntegerField(db_column='hideBool', blank=True, null=True)  # Field name made lowercase.
    lastmodified = models.DateTimeField(db_column='lastModified', blank=True, null=True)  # Field name made lowercase.
    flag1 = models.CharField(max_length=255, blank=True)
    flag2 = models.CharField(max_length=255, blank=True)
    def __str__(self):
        return self.first
    class Meta:
        managed = True
        db_table = 'people'

class Families(models.Model):
    familyid = models.IntegerField(db_column='familyID', primary_key=True)  # Field name made lowercase.
    caption = models.CharField(max_length=50, blank=True)
    motherid = models.IntegerField(db_column='motherID', blank=True, null=True)  # Field name made lowercase.
    fatherid = models.IntegerField(db_column='fatherID', blank=True, null=True)  # Field name made lowercase.
    divorced = models.IntegerField(blank=True, null=True)
    marriagedate = models.CharField(db_column='marriageDate', max_length=50, blank=True)  # Field name made lowercase.
    notes1 = models.CharField(db_column='Notes1', max_length=255, blank=True)  # Field name made lowercase.
    notes2 = models.CharField(db_column='Notes2', max_length=255, blank=True)  # Field name made lowercase.
    originalbool = models.IntegerField(db_column='originalBool', blank=True, null=True)  # Field name made lowercase.
    nokidsbool = models.IntegerField(db_column='noKidsBool', blank=True, null=True)  # Field name made lowercase.
    sequence = models.IntegerField(blank=True, null=True)
    branch = models.IntegerField(db_column='Branch', blank=True, null=True)  # Field name made lowercase.
    branchseq = models.CharField(db_column='Branchseq', max_length=5, blank=True)  # Field name made lowercase.
    keembool = models.IntegerField(db_column='KeemBool', blank=True, null=True)  # Field name made lowercase.
    husbandbool = models.IntegerField(db_column='HusbandBool', blank=True, null=True)  # Field name made lowercase.
    kemlerbool = models.IntegerField(db_column='KemlerBool', blank=True, null=True)  # Field name made lowercase.
    kaplanbool = models.IntegerField(db_column='KaplanBool', blank=True, null=True)  # Field name made lowercase.
    showonbranchviewbool = models.IntegerField(db_column='showOnBranchViewBool', blank=True, null=True)  # Field name made lowercase.
    flag1 = models.CharField(max_length=255, blank=True)
    flag2 = models.CharField(max_length=255, blank=True)
    lastmodified = models.DateTimeField(db_column='lastModified', blank=True, null=True)  # Field name made lowercase.
    def __str__(self):
        return self.caption
    class Meta:
        managed = True
        db_table = 'families'


class Notes(models.Model):
    noteid = models.IntegerField(db_column='noteID', primary_key=True)  # Field name made lowercase.
    refid = models.IntegerField(db_column='refID', blank=True, null=True)  # Field name made lowercase.
    type = models.IntegerField(db_column='Type', blank=True, null=True)  # Field name made lowercase.
    fromperson = models.IntegerField(db_column='fromPerson', blank=True, null=True)  # Field name made lowercase.
    body = models.TextField(blank=True)
    fromname = models.CharField(db_column='fromName', max_length=50, blank=True)  # Field name made lowercase.
    date = models.DateTimeField(blank=True, null=True)
    activebool = models.IntegerField(db_column='ActiveBool', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'Notes'


class Images(models.Model):
    imageid = models.IntegerField(db_column='imageID', primary_key=True)  # Field name made lowercase.
    bigname = models.CharField(db_column='bigName', max_length=50, blank=True)  # Field name made lowercase.
    stdname = models.CharField(db_column='stdName', max_length=50, blank=True)  # Field name made lowercase.
    littlename = models.CharField(db_column='littleName', max_length=50, blank=True)  # Field name made lowercase.
    caption = models.CharField(max_length=50, blank=True)
    subject = models.IntegerField(blank=True, null=True)
    featurebool = models.IntegerField(db_column='featureBool', blank=True, null=True)  # Field name made lowercase.
    year = models.CharField(db_column='Year', max_length=25, blank=True)  # Field name made lowercase.
    family = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'images'


class Imageperson(models.Model):
    imagegroupid = models.IntegerField(db_column='imageGroupID', primary_key=True)  # Field name made lowercase.
    imageid = models.IntegerField(db_column='imageID', blank=True, null=True)  # Field name made lowercase.
    personid = models.IntegerField(db_column='personID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'imagePerson'







class Specialinfo(models.Model):
    specialid = models.IntegerField(db_column='specialID', primary_key=True)  # Field name made lowercase.
    description = models.CharField(max_length=255, blank=True)
    img = models.CharField(max_length=50, blank=True)
    text = models.CharField(max_length=255, blank=True)
    page = models.CharField(max_length=50, blank=True)
    source = models.CharField(max_length=50, blank=True)

    class Meta:
        managed = True
        db_table = 'specialinfo'


class Specialinfoperson(models.Model):
    specialgroupid = models.IntegerField(db_column='specialgroupID', primary_key=True)  # Field name made lowercase.
    infoid = models.IntegerField(db_column='infoID', blank=True, null=True)  # Field name made lowercase.
    type = models.IntegerField(blank=True, null=True)
    subjectid = models.IntegerField(db_column='subjectID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'specialinfoPerson'

class Users(models.Model):
    userid = models.IntegerField(db_column='userID', primary_key=True)  # Field name made lowercase.
    email = models.CharField(max_length=50, blank=True)
    sharedaccount = models.IntegerField(db_column='sharedAccount', blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(max_length=50)
    lastlogin = models.DateTimeField(db_column='lastLogin', blank=True, null=True)  # Field name made lowercase.
    personid = models.IntegerField(db_column='personID', blank=True, null=True)  # Field name made lowercase.
    createdate = models.DateTimeField(db_column='createDate', blank=True, null=True)  # Field name made lowercase.
    lastpestered = models.DateTimeField(db_column='lastPestered', blank=True, null=True)  # Field name made lowercase.
    keemaccess = models.IntegerField(db_column='KeemAccess', blank=True, null=True)  # Field name made lowercase.
    husbandaccess = models.IntegerField(db_column='HusbandAccess', blank=True, null=True)  # Field name made lowercase.
    kemleraccess = models.IntegerField(db_column='KemlerAccess', blank=True, null=True)  # Field name made lowercase.
    kaplanaccess = models.IntegerField(db_column='KaplanAccess', blank=True, null=True)  # Field name made lowercase.
    logins = models.IntegerField(db_column='Logins', blank=True, null=True)  # Field name made lowercase.
    activebool = models.IntegerField(db_column='ActiveBool', blank=True, null=True)  # Field name made lowercase.
    connection_notes = models.CharField(max_length=255, blank=True)
    superadmin = models.IntegerField(db_column='superAdmin', blank=True, null=True)  # Field name made lowercase.
    furthesthtml = models.CharField(db_column='furthestHTML', max_length=255, blank=True)  # Field name made lowercase.

    class Meta:
        managed = True
        db_table = 'users'


class Updates(models.Model):
    changeid = models.IntegerField(db_column='changeID', primary_key=True)  # Field name made lowercase.
    userid = models.IntegerField(db_column='userID', blank=True, null=True)  # Field name made lowercase.
    personid = models.IntegerField(db_column='personID', blank=True, null=True)  # Field name made lowercase.
    familyid = models.IntegerField(db_column='familyID', blank=True, null=True)  # Field name made lowercase.
    date = models.DateTimeField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    moderated = models.IntegerField(db_column='Moderated', blank=True, null=True)  # Field name made lowercase.
    status = models.CharField(db_column='Status', max_length=50, blank=True)  # Field name made lowercase.
    notes = models.CharField(max_length=200, blank=True)

    class Meta:
        managed = True
        db_table = 'updates'


