import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterworkshop/Views/products_screen.dart';
import '../Model/products_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  List imageList=[
    {"id":1,"imagePath":"https://static.independent.co.uk/2022/04/07/17/tablets%20copy.jpg"},
    {"id":2,"imagePath":"https://www.phoneworld.com.pk/wp-content/uploads/2020/06/MID-RANGE-SMARTPHONES-IN-PAKISTAN-H1-2020-min.png"},

  ];
  final CarouselController c=CarouselController();
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shooping App"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[200],
      ),
      body:Column(
        children: [
          CarouselSlider(items:
          imageList.map((item)=>Image.network(item['imagePath'],fit: BoxFit.cover,width: double.infinity,)).toList(),
              carouselController: c,
              options: CarouselOptions(
                aspectRatio: 2,
                viewportFraction: 1,
                autoPlay: true,
                scrollPhysics: BouncingScrollPhysics(),
                onPageChanged: (index,reason){
                  setState(() {
                    currentIndex=index;
                  });
                }
              ),
          ),
          SizedBox(height:25),
          Text("Welcome to MyShopp",style: TextStyle(color:Colors.purple,fontSize: 26,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.pink[200],
                width:150,
                height: 140,
                child: Column(
                  children:[
                    Icon(Icons.discount),
                    Text("30% Discount available ",style: TextStyle(color:Colors.purple,fontSize: 19,fontWeight: FontWeight.bold),),
    ]

                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                color: Colors.pink[200],
                width:150,
                height: 140,
                child: Column(
                    children:[
                      Icon(Icons.star),
                      Text("100+ Users",style: TextStyle(color:Colors.purple,fontSize: 19,fontWeight: FontWeight.bold),),
                    ]

                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Products1()));},
            child: Text("Get Started"),style: ElevatedButton.styleFrom(primary: Colors.purple),)

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.phone,color: Colors.purple,),label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Cart"),

        ],
      ),
    );
  }
}
