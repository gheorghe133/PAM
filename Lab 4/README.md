# Street Clothes - Lab 4

Flutter clothing store app with **Clean Architecture**, **Web Service Integration**, and **JSON Serialization**.

## 🏗️ Architecture

This project implements **Clean Architecture** with three distinct layers:
- **Domain Layer**: Business entities and repository interfaces
- **Data Layer**: Models, data sources, and repository implementations
- **Presentation Layer**: BLoC, screens, and widgets

See [CLEAN_ARCHITECTURE.md](CLEAN_ARCHITECTURE.md) for detailed architecture documentation.

## 🚀 Features

### Clean Architecture (NEW in Lab 4)
- **3 Layers**: Domain, Data, Presentation
- **Dependency Inversion**: Presentation → Domain ← Data
- **Separation of Concerns**: Each layer has specific responsibilities
- **Testability**: Independent testing of each layer

### Web Service Integration (NEW in Lab 4)
- **HTTP Package**: `http: ^1.6.0`
- **API Endpoints**:
  - Feed: `https://test-api-jlbn.onrender.com/v3/feed`
  - Details: `https://test-api-jlbn.onrender.com/v3/feed/details`
- **Network Images**: Dynamic image loading from URLs
- **Error Handling**: Retry mechanism for failed requests

### JSON Serialization
- **Packages**: `json_annotation`, `json_serializable`
- **Data Models**: Automatic JSON parsing with code generation
- **Entity Conversion**: Models → Domain Entities
- **Code Generation**: `build_runner` for serialization code

### State Management with BLoC
- **Package**: `flutter_bloc: ^8.1.3`
- **Components**: FeedBloc, FeedEvent, FeedState
- **States**: Loading, Loaded, Error, Updating, ProductDetailLoaded
- **Repository Pattern**: Clean separation of concerns

### UI Features
- Pull-to-refresh on both pages (home and product detail)
- Consistent loading indicators
- Navigation between pages with state management
- Toggle favorite for products
- Consistent status bar across all pages

## 📁 Project Structure

```
lib/
├── main.dart                           # Entry point with DI
│
├── domain/                             # DOMAIN LAYER
│   ├── entities/                       # Business entities
│   │   ├── feed_item.dart             # Product entity
│   │   ├── feed_section.dart          # Section entity
│   │   ├── feed_header.dart           # Header entity
│   │   └── product_detail.dart        # Detail entities
│   └── repositories/                   # Repository interfaces
│       └── feed_repository.dart       # Abstract repository
│
├── data/                               # DATA LAYER
│   ├── models/                         # Data models (JSON)
│   │   ├── feed_item_model.dart
│   │   ├── feed_section_model.dart
│   │   ├── feed_header_model.dart
│   │   ├── feed_response_model.dart
│   │   └── product_detail_model.dart
│   ├── datasources/                    # Data sources
│   │   └── remote_data_source.dart    # HTTP API calls
│   └── repositories/                   # Repository implementations
│       └── feed_repository_impl.dart
│
├── presentation/                       # PRESENTATION LAYER
│   ├── bloc/                           # State management
│   │   ├── feed_bloc.dart
│   │   ├── feed_event.dart
│   │   └── feed_state.dart
│   └── screens/
│       └── home_screen_new.dart       # Main screen
│
├── widgets/                            # Reusable UI components
│   ├── custom_status_bar.dart
│   ├── hero_section.dart              # Updated for network images
│   ├── product_card.dart              # Updated for network images
│   └── product_section.dart
│
└── screens/                            # Legacy screens
    ├── home_screen.dart
    └── product_detail_screen.dart
```

## 🔧 Main Components

### Domain Layer
- **Entities**: Pure business objects (FeedItem, FeedSection, ProductDetail)
- **Repository Interface**: Contract for data operations
- **No Dependencies**: Pure Dart, no Flutter or external packages

### Data Layer
- **Models**: DTOs with JSON serialization (`@JsonSerializable`)
- **RemoteDataSource**: HTTP client for API calls
- **FeedRepositoryImpl**: Implements domain repository interface
- **Entity Conversion**: Models → Domain Entities

### Presentation Layer
- **FeedBloc**: State management with BLoC pattern
  - Events: LoadFeed, RefreshFeed, ToggleFeedItemFavorite, LoadProductDetail
  - States: FeedLoading, FeedLoaded, ProductDetailLoaded, FeedError
- **HomeScreenNew**: Main UI with feed display
- **Dependency Injection**: Repository injected via constructor

### Widgets
- **HeroSection**: Updated to support network images
- **ProductCard**: Updated to support network images
- **ProductSection**: Reusable section component

## 🌐 API Integration

### Endpoints
- **Feed**: `https://test-api-jlbn.onrender.com/v3/feed`
  - Returns header and sections (Sale, New)
  - Each section contains product items
- **Product Details**: `https://test-api-jlbn.onrender.com/v3/feed/details`
  - Returns detailed product information
  - Includes colors, sizes, shipping info, related products

### Data Flow
1. **User Action** → Pull to refresh
2. **FeedBloc** → Dispatches LoadFeed event
3. **Repository** → Calls RemoteDataSource
4. **HTTP Client** → Makes GET request to API
5. **JSON Response** → Parsed into Models
6. **Models** → Converted to Domain Entities
7. **BLoC** → Emits FeedLoaded state
8. **UI** → Updates with new data

## 🔄 Clean Architecture Benefits

### Testability
- Each layer can be tested independently
- Mock repositories for testing BLoC
- Mock data sources for testing repositories

### Maintainability
- Clear separation of concerns
- Easy to understand and modify
- Changes in one layer don't affect others

### Flexibility
- Easy to swap implementations (API → Local DB)
- Can add caching layer without changing domain
- Multiple data sources (API + Cache) possible

## 🚀 How to Run

```bash
# Install dependencies
flutter pub get

# Generate code for JSON serialization
flutter pub run build_runner build --delete-conflicting-outputs

# Run the application
# Option 1: Chrome with CORS disabled (recommended for web testing)
flutter run -d chrome --web-browser-flag "--disable-web-security"

# Option 2: macOS (requires Xcode)
flutter run -d macos

# Option 3: Android/iOS
flutter run -d android
flutter run -d ios
```

### ⚠️ CORS Issue on Web
When running on Chrome without the `--disable-web-security` flag, you may encounter CORS errors. This is a browser security feature. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for solutions.

## 📱 Features Implemented

### Lab 4 (NEW)
- ✅ Clean Architecture with 3 layers
- ✅ Web service integration (HTTP API)
- ✅ JSON serialization with code generation
- ✅ Network image loading
- ✅ Dependency injection
- ✅ Entity-Model separation
- ✅ Repository pattern with interfaces

### Previous Labs
- ✅ BLoC state management
- ✅ Pull-to-refresh functionality
- ✅ Navigation between screens
- ✅ Toggle favorite with state
- ✅ Loading indicators
- ✅ Error handling with retry
- ✅ Consistent status bar
