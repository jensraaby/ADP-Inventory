from datetime import datetime
from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from employees.models import Employee
    

class Mobile(models.Model):
    """
    Mobile is a phone, modem or anything with a sim-card
    """
    user = models.ForeignKey(Employee, null=True, blank=True,
     related_name="mobileDevices")
    name = models.CharField(max_length=50)
    model_desc = models.CharField(max_length=100)
    # TODO: make sure this is actually a string
    model_name = models.CharField(max_length=50)
    imei = models.CharField(max_length=50, unique=True, primary_key=True)
    iccid = models.CharField(max_length=50, null=True, blank=True)
    # TODO: maybe?
    uuid  = models.CharField(max_length=100)
    date_added = models.DateTimeField(auto_now_add=True)
    date_modified = models.DateTimeField(auto_now=True)
    
    def register(self, who):
        """ Sets this device to be owned by specified user from now on """
        obj_type = ContentType.objects.get_for_model(self)
        # find previous registrations
        previous = DeviceRegistration.objects.filter(content_type__pk = obj_type.id,
                                                     object_id = self.imei)
                                                     
        for p in previous:
            # cancel all the previous registrations if not set!
            if p.date_returned is None:
                p.date_returned = datetime.now()
                p.save()
    
        # create a new registration
        reg = DeviceRegistration(device = self, user=who)
        reg.save()
        self.user = who
        
    def __unicode__(self):
         return self.name
           


           
class DeviceRegistration(models.Model):
    content_type = models.ForeignKey(ContentType)
    object_id = models.CharField(max_length=100)
    device = generic.GenericForeignKey('content_type', 'object_id')
    user = models.ForeignKey(Employee, related_name="history")
    date_registered = models.DateTimeField(auto_now_add=True)
    date_returned   = models.DateTimeField(blank=True, null = True)
    
    def __unicode__(self):
        return self.content_type.model + ': ' + self.object_id + ' ' + self.user.sAMAccountName

           
class Workstation(models.Model):
    """
    Workstation is a computer (Mac or Windows)
    """
    # serialnumber, service_tag
    uuid = models.CharField(max_length=100, primary_key=True)
    hostname = models.CharField(max_length=50, null=False)
    user = models.ForeignKey(Employee, null=True, blank=True, related_name = "workstations") # maybe
    os = models.CharField( max_length=100 ) # OSX10.8 / WIN8 / WIN7
    # os_build = models.CharField( max_length=50 ) # version_id / build_id
    model_name = models.CharField(max_length=50)    
    model_desc = models.CharField(max_length=100)
    ram = models.IntegerField() # Could be models.CharField
    cpu = models.CharField(max_length=50) # "core 2 duo, 2.4 GHz"
    
    date_added = models.DateTimeField(auto_now_add = True)
    date_modified = models.DateTimeField(auto_now = True)
    
    #TODO refactor so no reuse with Mobile method
    def register(self, who):
        """ Sets this device to be owned by specified user from now on """
        obj_type = ContentType.objects.get_for_model(self)
        # find previous registrations
        previous = DeviceRegistration.objects.filter(content_type__pk = obj_type.id,
                                                     object_id = self.uuid)
                                                     
        for p in previous:
            # cancel all the previous registrations if not set!
            if p.date_returned is None:
                p.date_returned = datetime.now()
                p.save()
    
        # create a new registration
        reg = DeviceRegistration(device = self, user=who)
        reg.save()
        self.user = who
        
    def __unicode__(self):
        return self.dns_name
        
 
