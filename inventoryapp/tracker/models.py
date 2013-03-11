from django.db import models

class DeviceManufacturer(models.Model):
    name = models.CharField(max_length=50)
    added_date = models.DateTimeField('date added')
    
class DeviceModel(models.Model):
    """
    DeviceModel: model (e.g. MacBook4,1)
    """
    model_name = models.CharField(max_length=50)
    manufacturer = models.ForeignKey(DeviceManufacturer)
    added_date = models.DateTimeField('date added')
    
class Device(models.Model):
    """
    Device: parent class for all devices
    """
    # give the device's serial number
    uuid = models.CharField(max_length=100)
    added_date = models.DateTimeField('date added')
    device_model = models.ForeignKey(DeviceModel)
    
    class Meta:
           abstract = True
 
 
class MobileDevice(Device):
    """
    Mobile is a phone, modem or anything with a sim-card
    """
    imei = models.CharField(max_length=50)
    iccid = models.CharField(max_length=50)  
           
           
class WorkstationDevice(Device):
    """
    Workstation is a computer (mac or windows)
    """
    os = models.CharField(max_length=100)
    dns_name = models.CharField(max_length=100)
       

    

    

    

    
