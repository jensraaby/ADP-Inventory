from django.contrib import admin
from tracker.models import DeviceManufacturer, DeviceModel, WorkstationDevice


    
class DeviceModelAdmin(admin.ModelAdmin):
    fields = ['added_date', 'model_name', 'manufacturer']



    
admin.site.register(DeviceManufacturer)
admin.site.register(DeviceModel, DeviceModelAdmin)
admin.site.register(WorkstationDevice)