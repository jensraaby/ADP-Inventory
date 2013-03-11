from django.contrib import admin
from tracker.models import DeviceManufacturer, DeviceModel, WorkstationDevice, MobileDevice

    
admin.site.register(DeviceManufacturer)
admin.site.register(DeviceModel)
admin.site.register(WorkstationDevice)
admin.site.register(MobileDevice)