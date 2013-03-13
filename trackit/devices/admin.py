from django.contrib import admin
from devices.models import DeviceRegistration, Workstation, Mobile

admin.site.register(DeviceRegistration)
admin.site.register(Workstation)
admin.site.register(Mobile)