import 'package:flutter/material.dart';
import 'homepage.dart';

var name = "Aiman";
var password = "aiman999";

TextEditingController userNameContoller = TextEditingController();
TextEditingController passwordContoller = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Image.asset("assets/images/loginimage.png",fit:BoxFit.cover),
            SizedBox(
              height: 20.0,
            ),
            Text("Welcome",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  children: [
                    TextField(
                      controller: userNameContoller,
                        decoration: InputDecoration(
                          hintText: "Enter Usename",
                          labelText: "Username"
                        ),
                    ),
                    TextField(
                      controller: passwordContoller ,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue[800]),
                      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                      onPressed: (){
                      if(userNameContoller.text == name && passwordContoller.text == password){
                        Navigator.push(context, MaterialPageRoute(builder: (contex) => HomePage()));
                      }
                      else{
                        print("Unsuccessul login");
                      }
                    },


                    ),
                  ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
