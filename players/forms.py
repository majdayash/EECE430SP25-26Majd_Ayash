from django import forms
from .models import Player


class PlayerForm(forms.ModelForm):
    class Meta:
        model = Player
        fields = ['name', 'date_joined', 'position', 'salary', 'contact_person']
        widgets = {
            'date_joined': forms.DateInput(attrs={'type': 'date'}),
        }
