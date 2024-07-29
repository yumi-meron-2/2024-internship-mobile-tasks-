import 'product.dart';
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