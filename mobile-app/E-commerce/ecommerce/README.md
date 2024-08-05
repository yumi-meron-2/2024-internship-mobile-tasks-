# Taks 6
- Implementing All Pages ✔️

# Task 7
1. Screen Navigation ✔️
2. Named Routes ✔️
3. Passing Data Between Screens ✔️
4. Navigation Animations ✔️
5. Handling Navigation Events ✔️



# Flutter E-commerce Mobile App

This Flutter e-commerce mobile app allows users to create, view, update, and delete products. The app is designed to provide a seamless user experience with smooth navigation animations and proper handling of navigation events.

## Features

- Home screen displaying a list of all products.
- Add/Edit Product screen for creating or editing product details.
- View Product screen for viewing details of a selected product.
- Smooth navigation animations and transitions between screens.
- Proper handling of back button navigation events.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or Visual Studio Code
- An Android or iOS device/emulator

### Installation
1. Clone the repository:
```bash
   git clone 'https://github.com/yumi-meron-2/2024-internship-mobile-tasks-.git
   cd flutter-ecommerce-app
```
2. Install dependencies:
```bash
  flutter pub get
```
3. Run the app:
```bash
  flutter run
```

### Main Files
- main.dart: The entry point of the application and The home screen that displays the list of products.
- product.dart: The Product class that defines the product model.
- product_provider.dart: The ProductProvider class that manages the state of the product list.
- add_product.dart: The screen for adding a product.
- update_product.dart: The screen for editing a product.
- details.dart: The screen for viewing the details of a selected product.
- search_page.dart: the screen for searching products.
- image_pick.dart: The custom image picker widget.
- custum_card.dart: The custom product card widget.
- textfield.dart: A reusable text field widget.

### Usage
#### Navigation and Routing

1. Screen Navigation:
The app has Four main screens: Home Screen, Add/update Product Screen, search screen and View Product Screen .
Implemented using Flutter's built-in navigation methods.

2. Named Routes:
Defined named routes for each screen to facilitate navigation.

3. Passing Data Between Screens:
- When adding or editing a product, users can input the product's title and description.
Product data is passed between the Home Screen and Add/Edit Product Screen.
- also product data is transfered from home screen and details screen.
  
4. Navigation Animations:
Implemented smooth navigation animations and transitions to enhance the user experience.

5. Handling Navigation Events:
Proper handling of the back button navigation to ensure the app navigates back to the Home Screen.

### Adding a Product
1. Navigate to the Add Product screen.
2. Enter the product title,price, categoty and description.
3. Click the image picker to select an image.
4. Click the "ADD" button to add the product.
   
### Editing a Product
1. Select a product from the Home Screen to navigate to the Edit Product screen.
2. Update the product title, price, category, description, and image as needed.
3. Click the "UPDATE" button to update the product.
   
### Viewing a Product
1. Select a product from the Home Screen to navigate to the Product Details screen.
2. View the product details.






![Screenshot_20240804_130728](https://github.com/user-attachments/assets/f7c18631-d85c-40ea-987c-d348368dab41)
![Screenshot_20240804_130737](https://github.com/user-attachments/assets/9e62ab72-46ff-4ef3-9286-8f64e468fd08)

![Screenshot_20240804_130747](https://github.com/user-attachments/assets/74d36b79-5955-48f4-80dc-a44c2685fd27)
![Screenshot_20240804_130809](https://github.com/user-attachments/assets/86498854-a544-4371-9807-c95485cf5954)
![Screenshot_20240804_130850_Media picker](https://github.com/user-attachments/assets/95e440e6-e9cc-4db9-a5fa-5911d68a716f)
![Screenshot_20240804_130905](https://github.com/user-attachments/assets/878a172f-278c-4cb3-9b99-f18a03abecf4)
![Screenshot_20240804_130914](https://github.com/user-attachments/assets/2dcbcb3d-9a3b-4ac5-89a5-e70589fd1434)
![Screenshot_20240804_130930](https://github.com/user-attachments/assets/102a2066-1395-494d-b55a-533b35127f31)
![Screenshot_20240804_130952](https://github.com/user-attachments/assets/c8c7d0a8-4609-4d30-93c9-2932bb329ffe)
![Screenshot_20240804_131010](https://github.com/user-attachments/assets/73daefea-8c84-4060-b4f0-77e05a1af16e)
