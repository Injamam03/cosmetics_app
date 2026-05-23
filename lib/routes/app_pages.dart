import 'package:get/get.dart';
import '../screens/authScreens/splashScreen/splash_screen.dart';
import '../screens/authScreens/onboardingScreen/onboarding_screen.dart';
import '../screens/authScreens/chooseRoleScreen/choose_role_screen.dart';
import '../screens/authScreens/signInScreen/sign_in_screen.dart';
import '../screens/authScreens/signUpScreen/sign_up_screen.dart';
import '../screens/authScreens/otpVerifyScreen/otp_verify_screen.dart';
import '../screens/authScreens/forgotPasswordScreen/forgot_password_screen.dart';
import '../screens/authScreens/createNewPasswordScreen/create_new_password_screen.dart';
import '../screens/authScreens/accountSuccessScreen/account_success_screen.dart';
import '../screens/customerScreens/homeScreen/home_screen.dart';
import '../screens/customerScreens/categoriesScreen/categories_screen.dart';
import '../screens/customerScreens/productDetailScreen/product_detail_screen.dart';
import '../screens/customerScreens/wishlistScreen/wishlist_screen.dart';
import '../screens/customerScreens/cartScreen/cart_screen.dart';
import '../screens/customerScreens/checkoutScreen/checkout_screen.dart';
import '../screens/customerScreens/orderSuccessScreen/order_success_screen.dart';
import '../screens/customerScreens/profileScreen/profile_screen.dart';
import '../screens/customerScreens/profileScreen/editProfileScreen/edit_profile_screen.dart';
import '../screens/customerScreens/profileScreen/changePasswordScreen/change_password_screen.dart';
import '../screens/customerScreens/profileScreen/contactSupportScreen/contact_support_screen.dart';
import '../screens/customerScreens/profileScreen/deleteAccountScreen/delete_account_screen.dart';
import '../screens/customerScreens/profileScreen/orderHistoryScreen/order_history_screen.dart';
import '../screens/sellerScreens/dashboardScreen/dashboard_screen.dart';
import '../screens/sellerScreens/productsScreen/products_screen.dart';
import '../screens/sellerScreens/inventoryScreen/inventory_screen.dart';
import '../screens/sellerScreens/ordersScreen/orders_screen.dart';
import '../screens/sellerScreens/insightsScreen/insights_screen.dart';
import '../screens/sellerScreens/addProductScreen/add_product_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.chooseRole, page: () => const ChooseRoleScreen()),
    GetPage(name: AppRoutes.signIn, page: () => const SignInScreen()),
    GetPage(name: AppRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.otpVerify, page: () => const OtpVerifyScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppRoutes.createNewPassword, page: () => const CreateNewPasswordScreen()),
    GetPage(name: AppRoutes.accountSuccess, page: () => const AccountSuccessScreen()),

    GetPage(name: AppRoutes.customerHome, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.categories, page: () => const CategoriesScreen()),
    GetPage(name: AppRoutes.productDetail, page: () => const ProductDetailScreen()),
    GetPage(name: AppRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
    GetPage(name: AppRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: AppRoutes.orderSuccess, page: () => const OrderSuccessScreen()),
    GetPage(name: AppRoutes.customerProfile, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: AppRoutes.changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: AppRoutes.contactSupport, page: () => const ContactSupportScreen()),
    GetPage(name: AppRoutes.deleteAccount, page: () => const DeleteAccountScreen()),
    GetPage(name: AppRoutes.orderHistory, page: () => const OrderHistoryScreen()),

    GetPage(name: AppRoutes.sellerHome, page: () => const DashboardScreen()),
    GetPage(name: AppRoutes.sellerProducts, page: () => const ProductsScreen()),
    GetPage(name: AppRoutes.sellerInventory, page: () => const InventoryScreen()),
    GetPage(name: AppRoutes.sellerOrders, page: () => const SellerOrdersScreen()),
    GetPage(name: AppRoutes.sellerInsights, page: () => const InsightsScreen()),
    GetPage(name: AppRoutes.addProduct, page: () => const AddProductScreen()),
  ];
}
