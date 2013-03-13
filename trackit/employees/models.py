from django.db import models

class Employee(models.Model):
    """
    Employee model based on AD sync database.
    the script can be updated to use this model.
    
    We could also extend the default Django user model
    """
    
    # 1-1 mapping to users. maybe not needed?
    # user = models.OneToOneField(User)
    
    sAMAccountName    = models.CharField(max_length=50,unique=True, primary_key = True)
    mail              = models.CharField(max_length=100,unique=True)
    userPrincipalName = models.CharField(max_length=100,unique=True)
    givenName         = models.CharField(max_length=50)
    sn                = models.CharField(max_length=50)
    displayName       = models.CharField(max_length=50)
    telephoneNumber   = models.CharField(max_length=50)
    modified          = models.DateTimeField(auto_now = True)
    
    
    
    def get_full_name(self):
            # The user is identified by their email address
            return self.givenName + ' ' + self.sn

