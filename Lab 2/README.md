# Street Clothes App - Refactored Architecture

This Flutter application has been refactored into a modular, reusable component architecture. The code is now organized into dedicated folders with universal widgets that can be easily reused and maintained.

## 📁 Project Structure

```
lib/
├── main.dart                      # App entry point
├── data/                          # Sample data and mock data
│   └── sample_products.dart       # Product sample data
├── models/                        # Data models
│   └── product.dart               # Product data model
├── screens/                       # Screen/Page widgets
│   ├── home_screen.dart           # Main home screen
│   └── product_detail_screen.dart # Product detail page
└── widgets/                       # Reusable UI components
    ├── hero_section.dart          # Hero/Banner section widgets
    ├── product_card.dart          # Universal product card widget
    ├── product_section.dart       # Universal product section widgets
    ├── product_image_gallery.dart # Product image gallery widget
    ├── product_info_section.dart  # Product information section
    └── product_actions_section.dart # Product actions (Add to Cart, Buy Now)
```

## 🧩 Universal Components

### 1. ProductCard Widget (`widgets/product_card.dart`)

A universal product card component that displays:

- Product image with sale/new labels
- Star ratings
- Brand name and product name
- Price information (with strikethrough for sales)
- Favorite button functionality

**Features:**

- Configurable dimensions
- Automatic sale/new label display
- Interactive favorite button
- Tap callbacks for navigation

### 2. ProductSection Widget (`widgets/product_section.dart`)

A universal section widget for displaying lists of products:

- **ProductSection**: Base component with full customization
- **SalesSection**: Specialized for sale products
- **NewSection**: Specialized for new products

**Features:**

- Customizable title and subtitle
- Horizontal scrolling product list
- "View all" functionality
- Empty state handling
- Callback functions for interactions

### 3. HeroSection Widget (`widgets/hero_section.dart`)

Universal hero/banner section components:

- **HeroSection**: Base component with full customization
- **StreetClothesHeroSection**: Specialized for the app's main banner
- **CustomHeroSection**: For custom hero sections with subtitle support

**Features:**

- Background image support (assets or network)
- Customizable text styling and positioning
- Optional status bar display
- Flexible content layout

### 4. ProductDetailScreen (`screens/product_detail_screen.dart`)

Complete product detail page with:

- **ProductImageGallery**: Image carousel with sale/new labels
- **ProductInfoSection**: Product details, size/color selection
- **ProductActionsSection**: Add to cart and buy now functionality

**Features:**

- Full product information display
- Interactive size and color selection
- Favorite toggle functionality
- Add to cart and buy now actions
- Responsive design with custom app bar

### 5. Product Detail Widgets

**ProductImageGallery** (`widgets/product_image_gallery.dart`):

- Image carousel with navigation
- Sale/New labels overlay
- Page indicators
- Support for multiple images

**ProductInfoSection** (`widgets/product_info_section.dart`):

- Product name, brand, and description
- Star ratings and reviews
- Price display with sale formatting
- Size and color selection
- Favorite button

**ProductActionsSection** (`widgets/product_actions_section.dart`):

- Selected options summary
- Add to cart button
- Buy now button
- Compact version for modals

## 📊 Data Model

### Product Model (`models/product.dart`)

Comprehensive product data structure with:

- Basic product information (id, name, brand, images)
- Pricing (old price, new price, automatic discount calculation)
- Status flags (isNew, isOnSale, isFavorite)
- Rating and review data
- Helper methods for formatting and state management

## 🎯 Key Benefits of Refactoring

### 1. **Reusability**

- Components can be used across different screens
- Easy to create new product sections (Featured, Trending, etc.)
- Consistent UI/UX across the app

### 2. **Maintainability**

- Clear separation of concerns
- Easy to update styling in one place
- Simplified debugging and testing

### 3. **Scalability**

- Easy to add new product types
- Simple to extend functionality
- Clean architecture for team development

### 4. **Flexibility**

- Configurable components with multiple parameters
- Support for different layouts and styles
- Easy customization for different use cases

## 🚀 Usage Examples

### Creating a Sales Section

```dart
SalesSection(
  products: saleProducts,
  onViewAllPressed: () => navigateToSales(),
  onProductTap: (product) => navigateToProduct(product),
  onFavoritePressed: (product) => toggleFavorite(product),
)
```

### Creating a Custom Product Section

```dart
ProductSection(
  title: "Featured",
  subtitle: "Hand-picked for you",
  products: featuredProducts,
  onViewAllPressed: () => navigateToFeatured(),
  onProductTap: (product) => navigateToProduct(product),
  onFavoritePressed: (product) => toggleFavorite(product),
)
```

### Creating a Custom Hero Section

```dart
CustomHeroSection(
  title: "Summer Collection",
  subtitle: "Discover the latest trends",
  backgroundImagePath: 'assets/summer_banner.jpg',
  textColor: Colors.white,
)
```

### Navigating to Product Detail

```dart
void _onProductTap(Product product) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailScreen(product: product),
    ),
  );
}
```

### Creating Product Detail Components

```dart
// Product Image Gallery
ProductImageGallery(
  imagePath: product.imagePath,
  isOnSale: product.isOnSale,
  saleLabel: product.saleLabel,
  isNew: product.isNew,
)

// Product Information Section
ProductInfoSection(
  product: product,
  selectedSize: selectedSize,
  selectedColor: selectedColor,
  onSizeChanged: (size) => setState(() => selectedSize = size),
  onColorChanged: (color) => setState(() => selectedColor = color),
  onFavoritePressed: () => toggleFavorite(),
)

// Product Actions Section
ProductActionsSection(
  product: product,
  selectedSize: selectedSize,
  selectedColor: selectedColor,
  onAddToCart: () => addToCart(),
  onBuyNow: () => buyNow(),
)
```

## 🔧 Customization

Each component is highly customizable through parameters:

- **Colors**: All colors can be customized
- **Sizes**: Dimensions are configurable
- **Content**: Text, images, and data are parameterized
- **Behavior**: Callback functions for all interactions
- **Styling**: Text styles and layouts are customizable

## 📱 Testing

The refactored code has been tested and runs successfully with:

- No compilation errors
- Proper widget rendering
- Interactive functionality working
- Clean console output

## 🎨 Design Consistency

All components follow the original design specifications while providing flexibility for future enhancements:

- Consistent color scheme
- Proper spacing and typography
- Responsive layout design
- Material Design principles
