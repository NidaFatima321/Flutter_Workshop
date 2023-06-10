import 'package:flutter/material.dart';
import 'package:untitled/Workshop/products_model.dart';
import 'package:untitled/Workshop/products_service.dart';

class Products1 extends StatefulWidget {
  const Products1({Key? key}) : super(key: key);

  @override
  State<Products1> createState() => _Products1State();
}

class _Products1State extends State<Products1> {
  ProductsService service1=ProductsService();
  //not initialized yet value will arrive later.
  //an object of class Products
  late Products products;
   @override
  void initState() {
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[100],
leading: Icon(Icons.shop),
    title: Text("Products"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          //To work with lists that contain a large
          // number of items, it's best to use the ListView.
          // builder constructor. In contrast to the default ListView constructor,
          // which requires creating all items at once, the ListView. builder()
          // constructor creates items as they're scrolled onto the screen.
          Expanded(child: ListView.builder(
             // In Flutter, the context refers
            // to the location of a widget in the widget tree.
            // It provides information about the surrounding
            // environment and services that the widget might need.
            // For example, the context can contain information
            // such as the theme of the app, the locale, the screen size, and more.
            itemCount: products.products.length,
              itemBuilder: (context,index){
              //index of each object and location of widget or object in widget tree.
              //jo bhi widget return ho uska size ho specified ye ik box banane ka widget hai
            return SizedBox(
              width: 500,
              height: 200,

              child: Card(
                color: Colors.indigo[100],
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(products.products[index].images[0],
                      height: 100,
                      width: 100,),
                  trailing: Column(

                    children: [
                      Text('Ratings',
                      style: TextStyle(
                        fontSize: 15,
                      ),),
                 SizedBox(
                 width: 100,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.star,
                     color: Colors.yellow,
                     size: 15,),
                     Icon(Icons.star,
                       color: Colors.yellow,
                       size: 15,),
                     Icon(Icons.star,
                       color: Colors.yellow,
                       size: 15,),
                     Icon(Icons.star,
                       color: Colors.yellow,
                       size: 15,),
                     Icon(Icons.star,
                       color: Colors.yellow,
                       size: 15,),
                   ],
                 ),
                 ),
                      Text('${products.products[index].rating}'),
                    ],
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Product:',
                      style: TextStyle(
                        fontSize: 18,

                      ),),
                      Text(products.products[index].title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                          color: Colors.purple,

                      ),
                      textAlign: TextAlign.center,),
                      Text("Price:",
                      style: TextStyle(
                        fontSize: 18
                      ),),
                      Text('${products.products[index].price} Dollars',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.purple
                      ),),


                      // Text('${products.products[index].discountPercentage}'),
                      // Text('${products.products[index].rating}'),
                      Text("In Stock:",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      Text('${products.products[index].stock}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                          color: Colors.purple
                      ),),
                    ],
                  ),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
  //outside of build method.
  void getData() async{
     //products me poora response jo k poora product object hai save horha
    //pr uske ander objects hain mazeed.
   products = await service1.getProducts();
    setState(() {

    });
  }
}
