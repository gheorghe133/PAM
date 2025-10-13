# Street Clothes - Lab 3

Flutter clothing store app with State Management (BLoC) and asynchronous programming.

## 🚀 Features

### State Management with BLoC
- **Package**: `flutter_bloc: ^8.1.3`
- **Components**: ProductBloc, ProductEvent, ProductState
- **States**: Loading, Loaded, Error, Updating, Selected

### Asynchronous Programming
- Data loading from `products.json`
- Repository Pattern for data management
- Error handling with retry functionality

### JSON Serialization
- **Packages**: `json_annotation`, `json_serializable`
- Product model with automatic serialization
- Code generation with `build_runner`

### UI Features
- Pull-to-refresh on both pages (home and product detail)
- Consistent loading indicators
- Navigation between pages with state management
- Toggle favorite for products
- Consistent status bar across all pages

## 📁 Project Structure

```
lib/
├── main.dart                      # Entry point
├── bloc/                          # BLoC State Management
│   ├── product_bloc.dart          # Business logic
│   ├── product_event.dart         # Events
│   └── product_state.dart         # States
├── data/                          # Data layer
│   └── product_repository.dart    # Repository pattern
├── models/                        # Data models
│   └── product.dart               # Product model
├── screens/                       # Screens
│   ├── home_screen.dart           # Main page
│   └── product_detail_screen.dart # Product detail
└── widgets/                       # Reusable widgets
    ├── custom_status_bar.dart     # Status bar components
    ├── hero_section.dart          # Hero banner
    ├── product_card.dart          # Product cards
    ├── product_section.dart       # Product sections
    └── product_images.dart        # Product image gallery
```

## 🔧 Main Components

### CustomStatusBar & StatusBarContent
- Consistent status bar across all pages
- Reusable components for "9:41", WiFi, battery
- Uniform styling with `FontWeight.w600`

### ProductBloc
- Manages application state
- Events: LoadProducts, RefreshProducts, ToggleFavorite, LoadProductById
- States: ProductLoading, ProductLoaded, ProductSelected, ProductError

### ProductRepository
- Asynchronous loading from JSON
- Delay simulation for async behavior demonstration
- Error handling with ProductLoadException

## 🐛 Bug Fixes Implemented

### 1. Navigation Bug Fix
- **Problem**: White screen when navigating back from product detail
- **Solution**: Modified HomeScreen to handle ProductSelected state

### 2. Pull-to-Refresh Consistency
- **Problem**: Missing pull-to-refresh on product detail page
- **Solution**: Added RefreshIndicator to product detail screen

### 3. Status Bar Consistency
- **Problem**: Different status bar between pages
- **Solution**: Created reusable StatusBarContent with consistent styling

## 🚀 How to Run

```bash
# Install dependencies
flutter pub get

# Generate code for JSON serialization
flutter packages pub run build_runner build

# Run the application
flutter run
```

## 📱 Tested Features

- ✅ Asynchronous product loading
- ✅ Pull-to-refresh on both pages
- ✅ Navigation between pages without white screen
- ✅ Toggle favorite with state management
- ✅ Consistent status bar
- ✅ Loading indicators
- ✅ Error handling with retry
