import 'dart:ffi';
import 'dart:io';

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
    if (input == null || input == 'F'){
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


// product class
class Product{
    
    String? name, description;
    double? price;

    Product(String? name, String? description, double price){
        this.name = name;
        this.description = description;
        this.price = price;
    }


}


// eCommerce class
class Product_Manager{
    //list to hold all products
    List<Product> products = [];

    // function to display product
    void display(product){
      String? name = product.name;
        String? description = product.description;
        double? price = product.price;
        print("Product Name: $name \t Description: $description \t Price: $price");
    }

    // function to add product to list
    void add_product(Product product){
        products.add(product);
        print('Product Added Successfully');
    }

    // function to display all products
    void view_all_products(){
      for (var item in products){
        display(item);
      }
    }

    // function to display single element
    void view_single_product(String? name){
      bool flag = false;
      for (var item in products){
        if (item.name == name){
          flag = true; //setting it to true to imply product is found
          display(item);
          break;
        }
      }
      //incase product is not found
      if (flag == false){
        print('Product Not Found');
      }
    }

    // function to update specific product
    void update_product(String? name, String? new_name, String? description, double price){
      bool flag = false;
      for (var item in products){
        if (item.name == name){
          flag = true; //setting it to true to imply product is found
          item.name = new_name;
          item.description = description;
          item.price = price;
          print('Product Updated Successfully.');
          break;
        }
      }
      // incase product is not found
      if (flag == false){
        print('Product Not Found');
      }
    }

    // dunction to delete specific product
    void delete_product(String? name){
      products.removeWhere((item) => item.name == name);
      print('Product Deleted Successfully.');
      }
    
}