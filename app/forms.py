from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)
    
    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2")


class CheckoutForm(forms.Form):
    name = forms.CharField(max_length=255)
    phone = forms.CharField(max_length=30)
    address_line = forms.CharField(max_length=255)
    city = forms.CharField(max_length=120)
    district = forms.CharField(max_length=120)
    postal_code = forms.CharField(max_length=30, required=False)
    note = forms.CharField(widget=forms.Textarea, required=False)