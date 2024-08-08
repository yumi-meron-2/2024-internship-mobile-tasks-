# eCommerce Mobile App - Clean Architecture Implementation
## Introduction
This project is an eCommerce mobile app built using Flutter. It follows Clean Architecture principles and employs Test-Driven Development (TDD) practices. The app supports CRUD (Create, Read, Update, Delete) operations for products.

###Project Structure
The project is organized according to Clean Architecture principles:
```
lib/
core/: Shared core components, entities, and error handling logic.
features/
product/: Main module for the eCommerce feature.
data/
models/: Contains the ProductModel class.

domain/
entities/: Contains the Product entity.
usecases/: Contains use cases for CRUD operations.
repositories/: contains Abstract class of the repository.

test/: Contains all unit tests.
```

### Entities
#### Product Entity

Defines a Product entity with the following properties:

- id: Unique identifier for the product.
- name: Name of the product.
- description: Description of the product.
- price: Price of the product.
- imageUrl: URL of the product's image.

### Use Cases
Defined use cases for each of the CRUD operations:

- InsertProduct: Adds a new product.
= UpdateProduct: Updates an existing product.
- DeleteProduct: Removes a product.
- GetProduct: Retrieves the details of a product.
- 
### Repositories
##### ProductRepository
Implements methods to perform CRUD operations using the defined use cases.

### Data Overview Layer
#### ProductModel
- Mirrors the Product entity.
- Includes conversion logic to and from JSON using fromJson and toJson methods.
- Unit Tests
- Unit tests for the ProductModel ensure correctness and reliability.


# Task Completion

## Task 9 - Domain Layer Refactoring for eCommerce App

### Entity Implementation:
✅ Accurate and comprehensive implementation of the product entity class with all required attributes and methods.

### Use Case Implementation:
✅ Accurate implementation of the ViewAllProductsUsecase use case class following callable class principles.

✅ Accurate implementation of the ViewProductUsecase use case class with correct parameter handling and logic.

✅ Accurate implementation of the CreateProductUsecase use case class with proper handling of new product creation.

✅ Accurate implementation of the UpdateProductUsecase use case class with proper handling of existing product editions.

✅ Accurate implementation of the DeleteProductUsecase use case class with proper handling of existing product deletion.

## Task 10: Data Overview Layer

✅ Step 1: Folder Setup(1 point)
Organize the project structure according to Clean Architecture principles. Create the following folders in the `lib` directory:
`core`: Contains the shared core components, entities, and error handling logic.
`features`: Includes feature-specific modules.
`features/product`: This will be the main module for the Ecommerce feature.
`test`: Contains all the unit and widget tests.
 
✅ Step 2: Implement Models (7 points)
- Inside the `features/ecommerce/data/models` directory, create a `Product_model.dart` file.
- Define the `ProductModel` class that mirrors the `Product` entity, and include conversion logic to and from JSON using `fromJson` and `toJson` methods.
- Write unit tests for the `ProductModel` to ensure its correctness.

✅ Step 3: Documentation (2 point)
- Update the project documentation to include information about architecture, data flow.
Ensure that the documentation is clear and comprehensive.
Make sure that you write on github readme.md

