from django.db import models

class Service(models.Model):
    name = models.CharField(max_length=200)
    master = models.CharField(max_length=100)
    price = models.IntegerField()

    class Meta:
        app_label = "services"

    def __str__(self):
        return self.name
