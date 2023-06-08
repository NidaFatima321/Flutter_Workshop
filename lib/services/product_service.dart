import 'package:flutterworkshop/Model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<Products> getProducts() async{
    var client=http.Client();
    try{
      var response=await client.get(
        Uri.parse("https://dummyjson.com/products")
      );
      Products products=productsFromJson(response.body);
      return products;
    }
    finally{
      client.close();
    }
}}