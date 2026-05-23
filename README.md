# Stitch Premium Cosmetics Marketplace

Flutter frontend project built from Figma design.

## Tech Stack
- **Flutter** (SDK ≥ 3.0.0)
- **GetX** — State management, navigation, dependency injection
- **flutter_screenutil** — Responsive sizing

## Architecture
- GetX pattern: Screen + Controller per feature
- Custom widgets: `CustomText`, `CustomButton`, `CustomTextField`
- All strings in `Constring` class
- Colors in `AppColors`, typography in `AppTextStyles`
- Routes in `AppRoutes` + `AppPages`

## Folder Structure
```
lib/
├── constant/
│   ├── constring.dart       ← All app text
│   ├── app_colors.dart      ← Design system colors
│   └── app_text_styles.dart ← Typography
├── routes/
│   ├── app_routes.dart      ← Route names
│   └── app_pages.dart       ← GetX pages
├── screens/
│   ├── authScreens/         ← Splash, Onboarding, Auth flows
│   ├── customerScreens/     ← Home, Shop, Cart, Profile
│   └── sellerScreens/       ← Dashboard, Products, Orders, Insights
└── widgets/
    ├── custom_text/
    ├── custombutton/
    └── custom_text_Field/
```

## Screens Implemented (28 total)

### Auth (9)
- Splash Screen
- Onboarding Screen
- Choose Role Screen
- Sign In Screen
- Sign Up Screen
- OTP Verify Screen
- Forgot Password Screen
- Create New Password Screen
- Account Success Screen

### Customer (14)
- Home Screen
- Categories Screen
- Product Detail Screen
- Wishlist Screen
- Cart Screen
- Checkout Screen (3-step)
- Order Success Screen
- Profile Screen
- Edit Profile Screen
- Change Password Screen
- Contact Support Screen
- Delete Account Screen
- Order History Screen

### Seller (6)
- Dashboard Screen
- Products Management Screen
- Inventory Screen
- Orders Screen
- Insights & Analytics Screen
- Add Product Screen (4-step wizard)

## Setup
1. Run `flutter pub get`
2. Add fonts to `assets/fonts/` (Manrope & Bodoni Moda)
3. Run `flutter run`

## Notes
- Add actual font files to `assets/fonts/` from Google Fonts
- Images use placeholder icons — replace with actual assets
- API integration ready — controllers have async methods
