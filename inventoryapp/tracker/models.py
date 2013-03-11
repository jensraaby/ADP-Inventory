from django.db import models

class Device(models.Model):
    """
    Device: parent class for all devices
    """
    # give the device's serial number
    uuid = models.CharField(max_length=100)
    added_date = models.DateTimeField('date added')
    
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
    

    

    
