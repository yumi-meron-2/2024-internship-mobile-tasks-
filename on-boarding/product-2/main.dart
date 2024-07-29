import 'dart:io';
import 'product.dart';
import 'product_manager.dart';
void main() {
  // initializing the eCommerce object
  Product_Manager product_manager = Product_Manager();
  
  String? input;

  // while loop for letting user to use the service as long as they like too
  do{
    // prompt questions 
    print('''
          What Do You Want To Do?\n
          A) Add Product.\n
          B) Display All Products.\n
          C) Display Single Product.\n
          D) Update Product.\n
          E) Delete Product.\n
          F) Exit
    ''');

    String? input = stdin.readLineSync();
    
    // if they want to exit
    if (input == null){
      return ;
    }
    
    // if they want to add a product
    else if (input.toUpperCase() == 'A'){

      print("Enter Product Name: ");
      String? name = stdin.readLineSync();

      if (name == null){
        print("Invalid Input");
        continue;
      }

      print('Enter product description');
      String? description = stdin.readLineSync();

      print('Enter Product Price: ');
      String? price_str = stdin.readLineSync();

      double price = 0.00;
      if (price_str != null){
        price = double.parse(price_str);
      }

      // initializing our product object
      Product product = Product(name, description, price);
      // calling the function to add product
      product_manager.add_product(product);
      
      }

    //if they want to display all products
    else if (input.toUpperCase() == 'B'){
      product_manager.view_all_products();
      }

    // if they want to display specific product
    else if ( input.toUpperCase() == 'C'){
      print("Enter Product Name To Be Displayed: ");
      String? name = stdin.readLineSync();
      product_manager.view_single_product(name);
    }

    //if they want to update specific product
    else if (input.toUpperCase() == 'D'){
      print("Enter Product Name To Be Updated: ");
      String? name = stdin.readLineSync();

      print("Enter New Product Name: ");
      String? new_name = stdin.readLineSync();

      print('Enter product description');
      String? description = stdin.readLineSync();

      print('Enter Product Price: ');
      String? price_str = stdin.readLineSync();

      double price = 0.00;
      if (price_str != null){
        price = double.parse(price_str);
      }

      product_manager.update_product(name, new_name, description, price);

    }

    // if they want to delete specific product
    else if (input.toUpperCase() == 'E'){
      print("Enter Product Name To Be Deleted: ");
      String? name = stdin.readLineSync();
      product_manager.delete_product(name);
      
    }
    else if (input.toUpperCase() == 'F'){
      break;
    }
    
    else{
      print('Invalid Input.');
    }

    // prompting user if they want to continue using the servies
    print('Do you want to continue:\n say \'yes\' or \'no\' ');
    String? continueInput = stdin.readLineSync();
    if (continueInput == null || continueInput.toLowerCase() != 'yes') {
      break;
    }

  }while(input!= 'F');


    }
