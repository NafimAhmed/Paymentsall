import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      body: Column(
        children: [
          Container(
            height: 420,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png',height: 40,width: 40,),
                      const Text('EasyPay',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Image.asset('assets/images/WelcomeImage.png',height: 310,width: 320,),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 296,width: 400,
            color: Colors.white,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const Text('Easy Online Payment',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const Text('Make your payment experience more better today.No additional admin fee',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
                const SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: 360,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey.shade400,width: 1.2),
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.deepOrange.shade50
                   // color: Colors.red.shade800
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){},
                    child: const Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black),),
                  ),
                ),
                Container(
                  height: 50,
                  width: 360,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400,width: 1.0),
                    borderRadius: BorderRadius.circular(4.0),
                   // color: Colors.deepOrange.shade50
                    color: Colors.white
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){},
                    child: const Text('Sign Up',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
