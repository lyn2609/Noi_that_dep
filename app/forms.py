from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate


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


COMMON_PASSWORDS = {
    '123456', '123456789', '12345678', '111111', 'qwerty', 'password',
    'abc123', '123123', '000000', 'iloveyou', 'admin'
}

class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2")

    def clean_password1(self):
        password = self.cleaned_data.get('password1')
        username = self.cleaned_data.get('username', '').lower()
        email = self.cleaned_data.get('email', '').lower()

        # 1 Độ dài ít nhất 8 ký tự
        if len(password) < 8:
            raise forms.ValidationError("Mật khẩu phải có ít nhất 8 ký tự.")

        # 2 Không quá giống thông tin cá nhân
        similar_parts = []
        if username:
            similar_parts.append(username)
        if email:
            similar_parts.append(email.split('@')[0])
        for part in similar_parts:
            if len(part) >= 3 and part in password.lower():
                raise forms.ValidationError("Mật khẩu quá giống tên đăng nhập hoặc email.")

        # 3 Không thuộc danh sách mật khẩu phổ biến
        if password.lower() in COMMON_PASSWORDS:
            raise forms.ValidationError("Mật khẩu quá phổ biến, vui lòng chọn mật khẩu mạnh hơn.")

        # 4 Không hoàn toàn là số
        if password.isdigit():
            raise forms.ValidationError("Mật khẩu không được chỉ toàn là số.")

        return password


class LoginForm(forms.Form):
    username = forms.CharField(
        label="Tên đăng nhập",
        widget=forms.TextInput(attrs={
            'placeholder': 'Tên đăng nhập',
            'class': 'form-control'
        })
    )
    password = forms.CharField(
        label="Mật khẩu",
        widget=forms.PasswordInput(attrs={
            'placeholder': 'Mật khẩu',
            'class': 'form-control'
        })
    )

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if user is None:
                raise forms.ValidationError("Tên đăng nhập hoặc mật khẩu không đúng.")
        return cleaned_data