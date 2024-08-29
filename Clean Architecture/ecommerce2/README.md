# eCommerce Mobile App - Clean Architecture Implementation
## Introduction
This project is an eCommerce mobile app built using Flutter. It follows Clean Architecture principles and employs Test-Driven Development (TDD) practices. The app supports CRUD (Create, Read, Update, Delete) operations for products.

### Project Structure
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
 
### Repositories
##### ProductRepository
Abstract class to perform CRUD operations using the defined use cases.

### Data Overview Layer
#### ProductModel
- Mirrors the Product entity.
- Includes conversion logic to and from JSON using fromJson and toJson methods.
- Unit Tests
- Unit tests for the ProductModel ensure correctness and reliability.


