from django.db import models


class Player(models.Model):
    POSITION_CHOICES = [
        ('Setter', 'Setter'),
        ('Outside Hitter', 'Outside Hitter'),
        ('Middle Blocker', 'Middle Blocker'),
        ('Opposite', 'Opposite'),
        ('Libero', 'Libero'),
        ('Defensive Specialist', 'Defensive Specialist'),
    ]

    name = models.CharField(max_length=100)
    date_joined = models.DateField()
    position = models.CharField(max_length=50, choices=POSITION_CHOICES)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    contact_person = models.CharField(max_length=100)

    class Meta:
        ordering = ['id']

    def __str__(self):
        return self.name
