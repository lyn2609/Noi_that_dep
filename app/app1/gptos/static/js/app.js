// Global variables
let cart = [];
let currentImageIndex = 0;

// DOM Elements
const cartToggle = document.getElementById('cart-toggle');
const closeCart = document.getElementById('close-cart');
const cartSidebar = document.getElementById('cart-sidebar');
const overlay = document.getElementById('overlay');
const cartItems = document.getElementById('cart-items');
const cartCount = document.getElementById('cart-count');
const cartTotal = document.getElementById('cart-total');

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

function initializeApp() {
    setupEventListeners();
    loadCartFromStorage();
    updateCartUI();
    
    // Load featured products on homepage
    if (document.getElementById('featured-products')) {
        loadFeaturedProducts();
    }
    
    // Setup mobile menu
    setupMobileMenu();
}

function setupEventListeners() {
    // Cart toggle events
    if (cartToggle) {
        cartToggle.addEventListener('click', toggleCart);
    }
    
    if (closeCart) {
        closeCart.addEventListener('click', closeCartSidebar);
    }
    
    if (overlay) {
        overlay.addEventListener('click', closeCartSidebar);
    }
    
    // Search functionality
    const searchButton = document.getElementById('search-button');
    const searchInput = document.getElementById('search-input');
    
    if (searchButton && searchInput) {
        searchButton.addEventListener('click', performSearch);
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }
}

function setupMobileMenu() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mainNav = document.querySelector('.main-nav');
    
    if (mobileMenuBtn && mainNav) {
        mobileMenuBtn.addEventListener('click', function() {
            mainNav.classList.toggle('active');
        });
    }
}

function performSearch() {
    const searchInput = document.getElementById('search-input');
    const searchTerm = searchInput.value.trim().toLowerCase();
    
    if (searchTerm) {
        // Redirect to product page with search term
        window.location.href = `product.html?search=${encodeURIComponent(searchTerm)}`;
    }
}

// Cart Functions
function toggleCart() {
    cartSidebar.classList.toggle('active');
    overlay.classList.toggle('active');
    document.body.style.overflow = cartSidebar.classList.contains('active') ? 'hidden' : '';
}

function closeCartSidebar() {
    cartSidebar.classList.remove('active');
    overlay.classList.remove('active');
    document.body.style.overflow = '';
}

function addToCart(productId, quantity = 1) {
    const product = products.find(p => p.id == productId);
    
    if (!product) return;
    
    const existingItem = cart.find(item => item.id === productId);
    
    if (existingItem) {
        existingItem.quantity += quantity;
    } else {
        cart.push({
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.image,
            quantity: quantity
        });
    }
    
    saveCartToStorage();
    updateCartUI();
    
    // Show notification
    showNotification(`${product.name} đã được thêm vào giỏ hàng!`);
}

function removeFromCart(productId) {
    cart = cart.filter(item => item.id !== productId);
    saveCartToStorage();
    updateCartUI();
}

function updateQuantity(productId, newQuantity) {
    if (newQuantity <= 0) {
        removeFromCart(productId);
        return;
    }
    
    const item = cart.find(item => item.id === productId);
    if (item) {
        item.quantity = newQuantity;
        saveCartToStorage();
        updateCartUI();
    }
}

function saveCartToStorage() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

function loadCartFromStorage() {
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
        cart = JSON.parse(savedCart);
    }
}

function updateCartUI() {
    // Update cart count
    const totalItems = cart.reduce((total, item) => total + item.quantity, 0);
    if (cartCount) {
        cartCount.textContent = totalItems;
    }
    
    // Update cart sidebar
    if (cartItems) {
        if (cart.length === 0) {
            cartItems.innerHTML = '<p class="empty-cart">Giỏ hàng của bạn đang trống</p>';
        } else {
            cartItems.innerHTML = cart.map(item => `
                <div class="cart-item">
                    <div class="cart-item-image">
                        <img src="/static/${item.image}" alt="${item.name}">
                    </div>
                    <div class="cart-item-info">
                        <h4>${item.name}</h4>
                        <div class="cart-item-price">${item.price.toLocaleString('vi-VN')}₫</div>
                        <div class="cart-item-actions">
                            <div class="quantity-control">
                                <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity - 1})">-</button>
                                <span class="quantity-display">${item.quantity}</span>
                                <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity + 1})">+</button>
                            </div>
                            <span class="remove-item" onclick="removeFromCart(${item.id})">Xóa</span>
                        </div>
                    </div>
                </div>
            `).join('');
        }
    }
    
    // Update cart total
    const totalPrice = cart.reduce((total, item) => total + (item.price * item.quantity), 0);
    if (cartTotal) {
        cartTotal.textContent = totalPrice.toLocaleString('vi-VN');
    }
}

function showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: #27ae60;
        color: white;
        padding: 15px 20px;
        border-radius: 4px;
        z-index: 1200;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        transform: translateX(100%);
        transition: transform 0.3s ease;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.transform = 'translateX(0)';
    }, 100);
    
    setTimeout(() => {
        notification.style.transform = 'translateX(100%)';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Homepage Functions
function loadFeaturedProducts() {
    const container = document.getElementById('featured-products');
    if (!container) return;
    
    container.innerHTML = featuredProducts.map(product => `
        <div class="product-card">
            <div class="product-image">
                <img src="/static/${product.image}" alt="${product.name}">
                <div class="product-overlay">
                    <button class="btn btn-secondary add-to-cart-btn" onclick="addToCart(${product.id})">
                        <i class="fas fa-shopping-cart"></i> Thêm vào giỏ
                    </button>
                    <a href="product.html?id=${product.id}" class="btn btn-primary">Xem Chi Tiết</a>
                </div>
            </div>
            <div class="product-info">
                <h3>${product.name}</h3>
                <p class="product-price">${product.price.toLocaleString('vi-VN')}₫</p>
            </div>
        </div>
    `).join('');
}

// Product Detail Functions
function loadProductDetail(productId) {
    const product = products.find(p => p.id == productId);
    if (!product) {
        window.location.href = 'product.html';
        return;
    }
    
    const productDetail = document.getElementById('product-detail');
    if (!productDetail) return;
    
    const breadcrumbCategory = document.getElementById('breadcrumb-category');
    const breadcrumbProduct = document.getElementById('breadcrumb-product');
    if (breadcrumbCategory) breadcrumbCategory.textContent = getCategoryName(product.category);
    if (breadcrumbProduct) breadcrumbProduct.textContent = product.name;
    
    productDetail.innerHTML = `
        <div class="container">
            <div class="product-detail-content">
                <div class="product-detail-images">
                    <div class="product-main-image">
                        <img src="/static/${product.images[0] || product.image}" alt="${product.name}" id="main-product-image">
                    </div>
                    <div class="product-thumbnails">
                        ${(product.images || [product.image]).map((img, index) => `
                            <div class="thumbnail ${index === 0 ? 'active' : ''}" onclick="changeMainImage('/static/${img}', this)">
                                <img src="/static/${img}" alt="${product.name}">
                            </div>
                        `).join('')}
                    </div>
                </div>
                
                <div class="product-detail-info">
                    <h1>${product.name}</h1>
                    <div class="product-detail-price">${product.price.toLocaleString('vi-VN')}₫</div>
                    <div class="product-detail-description">
                        <p>${product.description}</p>
                    </div>
                    
                    <div class="product-options">
                        <div class="option-group">
                            <label>Số lượng:</label>
                            <div class="quantity-selector">
                                <button class="quantity-btn" id="decrease-qty">-</button>
                                <span class="quantity-display" id="quantity-display">1</span>
                                <button class="quantity-btn" id="increase-qty">+</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="add-to-cart-section">
                        <button class="btn btn-primary" onclick="addToCartWithQuantity(${product.id})">
                            <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                        </button>
                        <button class="btn btn-secondary">Mua ngay</button>
                    </div>
                    
                    <div class="product-specifications">
                        <h3>Thông số kỹ thuật</h3>
                        <ul>
                            <li><strong>Kích thước:</strong> ${product.dimensions}</li>
                            <li><strong>Chất liệu:</strong> ${product.material}</li>
                            <li><strong>Bảo hành:</strong> ${product.warranty}</li>
                        </ul>
                    </div>
                    
                    <div class="product-features">
                        <h3>Tính năng nổi bật</h3>
                        <ul>
                            ${product.features.map(feature => `<li>${feature}</li>`).join('')}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    setupProductDetailEvents();
    loadRelatedProducts(product.category, productId);
}

function setupProductDetailEvents() {
    const decreaseBtn = document.getElementById('decrease-qty');
    const increaseBtn = document.getElementById('increase-qty');
    const quantityDisplay = document.getElementById('quantity-display');
    
    if (decreaseBtn && increaseBtn && quantityDisplay) {
        let quantity = 1;
        
        decreaseBtn.addEventListener('click', function() {
            if (quantity > 1) {
                quantity--;
                quantityDisplay.textContent = quantity;
            }
        });
        
        increaseBtn.addEventListener('click', function() {
            quantity++;
            quantityDisplay.textContent = quantity;
        });
    }
}

function addToCartWithQuantity(productId) {
    const quantityDisplay = document.getElementById('quantity-display');
    const quantity = parseInt(quantityDisplay?.textContent) || 1;
    addToCart(productId, quantity);
}

function changeMainImage(imageSrc, thumbnailElement) {
    const mainImage = document.getElementById('main-product-image');
    if (mainImage) {
        mainImage.src = imageSrc;
    }
    
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(thumb => thumb.classList.remove('active'));
    if (thumbnailElement) {
        thumbnailElement.classList.add('active');
    }
}

function getCategoryName(categoryKey) {
    const categories = {
        'sofa': 'Sofa',
        'ban': 'Bàn',
        'giuong': 'Giường',
        'ke': 'Kệ',
        'ghe': 'Ghế'
    };
    return categories[categoryKey] || 'Sản Phẩm';
}

function loadRelatedProducts(category, excludeId) {
    const relatedContainer = document.getElementById('related-products');
    if (!relatedContainer) return;
    
    const relatedProducts = products
        .filter(p => p.category === category && p.id != excludeId)
        .slice(0, 4);
    
    if (relatedProducts.length > 0) {
        relatedContainer.innerHTML = relatedProducts.map(product => `
            <div class="product-card">
                <div class="product-image">
                    <img src="/static/${product.image}" alt="${product.name}">
                    <div class="product-overlay">
                        <button class="btn btn-secondary add-to-cart-btn" onclick="addToCart(${product.id})">
                            <i class="fas fa-shopping-cart"></i> Thêm vào giỏ
                        </button>
                        <a href="product.html?id=${product.id}" class="btn btn-primary">Xem Chi Tiết</a>
                    </div>
                </div>
                <div class="product-info">
                    <h3>${product.name}</h3>
                    <p class="product-price">${product.price.toLocaleString('vi-VN')}₫</p>
                </div>
            </div>
        `).join('');
    } else {
        relatedContainer.innerHTML = '<p>Không có sản phẩm liên quan.</p>';
    }
}

// Contact Form Handling
function setupContactForm() {
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(contactForm);
            const data = {};
            formData.forEach((value, key) => {
                data[key] = value;
            });
            
            console.log('Contact form submitted:', data);
            
            alert('Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi trong thời gian sớm nhất.');
            contactForm.reset();
        });
    }
}

if (window.location.pathname.includes('contact.html')) {
    document.addEventListener('DOMContentLoaded', setupContactForm);
}

// Make functions available globally
window.addToCart = addToCart;
window.updateQuantity = updateQuantity;
window.removeFromCart = removeFromCart;
window.changeMainImage = changeMainImage;
window.addToCartWithQuantity = addToCartWithQuantity;
window.loadProductDetail = loadProductDetail;

function filterProductsByCategory(category) {
    const categoryLinks = document.querySelectorAll('#category-filters a[data-category="' + category + '"]');
    if (categoryLinks.length > 0) {
        categoryLinks[0].click();
    }
}
