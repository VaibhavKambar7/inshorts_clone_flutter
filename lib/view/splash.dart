import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 300,),

          
          FadeInImage(
            
            placeholder : AssetImage("assets/img/logo.png"),
          image: AssetImage("assets/img/logo.png") ,
          
          height: 100 , width: 100,),

          Spacer(),
          // Text("Developed by\n \b Vaibhav \b" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 12 , ),),
          Text("Developed by" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 12 , ),),
          Text("Vaibhav" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold),),

          SizedBox(height: 20,),
        ],
      )),
    );
  }
}