# app/auth.py
from django import forms
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages

# ==================== FORM CLASSES ====================

class RegisterForm(forms.Form):
    """Form đăng ký"""
    username = forms.CharField(
        max_length=150,
        required=True,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Nhập tên đăng nhập'
        })
    )
    
    full_name = forms.CharField(
        max_length=255,
        required=False,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Nhập họ và tên (không bắt buộc)'
        })
    )
    
    email = forms.EmailField(
        required=True,
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'placeholder': 'example@email.com'
        })
    )
    
    password1 = forms.CharField(
        required=True,
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Nhập mật khẩu'
        })
    )
    
    password2 = forms.CharField(
        required=True,
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Xác nhận mật khẩu'
        })
    )
    
    def clean_username(self):
        """Kiểm tra username đã tồn tại chưa"""
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('Tên đăng nhập đã tồn tại!')
        return username
    
    def clean_email(self):
        """Kiểm tra email đã tồn tại chưa"""
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError('Email đã được sử dụng!')
        return email
    
    def clean(self):
        """Kiểm tra validation tổng thể"""
        cleaned_data = super().clean()
        password1 = cleaned_data.get('password1')
        password2 = cleaned_data.get('password2')
        username = cleaned_data.get('username', '').lower()
        email = cleaned_data.get('email', '').lower()
        full_name = cleaned_data.get('full_name', '').lower()
        
        # Kiểm tra mật khẩu khớp
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError('Mật khẩu không khớp!')
            
            # Kiểm tra độ dài
            if len(password1) < 8:
                raise forms.ValidationError('Mật khẩu phải có ít nhất 8 ký tự!')
            
            # Kiểm tra toàn số
            if password1.isdigit():
                raise forms.ValidationError('Mật khẩu không được chỉ toàn số!')
            
            # Kiểm tra mật khẩu phổ biến
            common_passwords = [
                '123456', '123456789', '12345678', '111111', 'qwerty', 
                'password', 'abc123', '123123', '000000', 'iloveyou', 'admin'
            ]
            if password1.lower() in common_passwords:
                raise forms.ValidationError('Mật khẩu này quá phổ biến!')
            
            # Kiểm tra giống thông tin cá nhân
            similar_parts = []
            if username:
                similar_parts.append(username)
            if email:
                similar_parts.append(email.split('@')[0])
            if full_name:
                similar_parts.extend([p for p in full_name.split() if len(p) >= 3])
            
            pwd_lower = password1.lower()
            for part in similar_parts:
                if part and len(part) >= 3 and part in pwd_lower:
                    raise forms.ValidationError('Mật khẩu không được chứa thông tin cá nhân!')
        
        return cleaned_data


# ==================== VIEW FUNCTIONS ====================

def user_login(request):
    """Xử lý đăng nhập"""
    if request.user.is_authenticated:
        return redirect('dashboard')
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        user = authenticate(request, username=username, password=password)
        
        if user:
            login(request, user)
            messages.success(request, f'Chào mừng {user.username}!')
            return redirect(request.GET.get('next', 'dashboard'))
        else:
            messages.error(request, 'Sai tên đăng nhập hoặc mật khẩu!')
    
    return render(request, 'auth/login.html')


def user_register(request):
    """Xử lý đăng ký"""
    if request.user.is_authenticated:
        return redirect('dashboard')
    
    if request.method == 'POST':
        form = RegisterForm(request.POST) # 1. Tạo form với dữ liệu POST
        
        if form.is_valid():
            # Lấy dữ liệu đã validate
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password1']
            full_name = form.cleaned_data.get('full_name', '')
            
            try:
                # Tạo user mới
                user = User.objects.create_user(
                    username=username,
                    email=email,
                    password=password
                )
                
                # Lưu họ tên nếu có
                if full_name:
                    name_parts = full_name.split(maxsplit=1)
                    user.first_name = name_parts[0]
                    if len(name_parts) > 1:
                        user.last_name = name_parts[1]
                    user.save()
                
                messages.success(request, 'Đăng ký thành công! Vui lòng đăng nhập.')
                return redirect('login')
                
            except Exception as e:
                messages.error(request, f'Lỗi: {str(e)}')
            
            # Nếu try/except lỗi, nó sẽ đi xuống và render lại form (với lỗi)
            
    else:
        form = RegisterForm() # 2. Tạo form rỗng cho GET request
    
    # 3. Render trang (cho GET request, hoặc khi POST bị lỗi validation)
    return render(request, 'auth/register.html', {'form': form})


def user_logout(request):
    """Xử lý đăng xuất"""
    logout(request)
    messages.info(request, 'Đã đăng xuất!')
    return redirect('login')


@login_required(login_url='login')
def dashboard(request):
    """Trang chủ sau khi đăng nhập"""
    return render(request, 'index.html', {'user': request.user})