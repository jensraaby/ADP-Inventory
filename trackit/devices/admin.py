from django.contrib import admin
from devices.models import DeviceRegistration, WorkstationDevice, MobileDevice

admin.site.register(DeviceRegistration)
admin.site.register(WorkstationDevice)
admin.site.register(MobileDevice)