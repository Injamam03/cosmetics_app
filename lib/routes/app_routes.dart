class AppRoutes {
  AppRoutes._();

  // Auth
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String chooseRole = '/choose-role';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String otpVerify = '/otp-verify';
  static const String forgotPassword = '/forgot-password';
  static const String createNewPassword = '/create-new-password';
  static const String accountSuccess = '/account-success';

  // Customer
  static const String customerHome = '/customer/home';
  static const String categories = '/customer/categories';
  static const String productDetail = '/customer/product-detail';
  static const String wishlist = '/customer/wishlist';
  static const String cart = '/customer/cart';
  static const String checkout = '/customer/checkout';
  static const String orderSuccess = '/customer/order-success';
  static const String customerProfile = '/customer/profile';
  static const String editProfile = '/customer/edit-profile';
  static const String changePassword = '/customer/change-password';
  static const String contactSupport = '/customer/contact-support';
  static const String deleteAccount = '/customer/delete-account';
  static const String orderHistory = '/customer/order-history';

  // Seller
  static const String sellerHome = '/seller/home';
  static const String sellerProducts = '/seller/products';
  static const String sellerInventory = '/seller/inventory';
  static const String sellerOrders = '/seller/orders';
  static const String sellerInsights = '/seller/insights';
  static const String addProduct = '/seller/add-product';
}
