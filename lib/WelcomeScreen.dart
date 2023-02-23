import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:payments_all_app/Login%20&%20Sign%20up/signUp/SignUpPage.dart';

import 'Login & Sign up/login/LoginPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  late PageController _pageController;
 late List<Widget>slideList;
 late int initialPage;
  @override
  void initState(){
    _pageController=PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            SafeArea(
              child: GFIntroScreen(
                height: 400,
                slides: slides(),
                 border: Border.all(color: Colors.white),
                pageController: _pageController,
                introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
                  pageController: _pageController,
                  pageCount: slideList.length,
                  currentIndex: initialPage,
                  navigationBarHeight: 50,
                  navigationBarColor: Colors.deepOrange.shade50,
                  showDivider: false,
                  dotHeight: 10,
                  dotWidth: 12,
                  dotShape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey,width: 1),
                     borderRadius: BorderRadius.circular(3)
                  ),
                  inactiveColor: Colors.grey,
                  activeColor: GFColors.LIGHT,
                 // dotMargin: EdgeInsets.symmetric(horizontal: 6),
                  showPagination: true,
                ),
                currentIndex: initialPage,
                pageCount: slideList.length,
              ),
            ),
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
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.deepOrange.shade50
              ),
              child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
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
                  color: Colors.white
              ),
              child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpPage();
                      },
                    ),
                  );
                },
                child: const Text('Sign Up',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Widget>slides(){
    slideList=[
      Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Payments_All.png',height: 30,width: 28,),
                  const Text('EasyPay',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                ],
              ),
             Image.asset('assets/images/WelcomeImage.png',height: 310,width: 320,)
            ],
          ),
        ),
      ),
      Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Image.asset('assets/images/Payments_All.png',height: 30,width: 28,),
                  Text('Easy Transfer Way',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                ],
              ),
             Image.asset('assets/images/easy transfer.png',height: 310,width: 320,)
            ],
          ),
        ),
      ),
      Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Image.asset('assets/images/Payments_All.png',height: 30,width: 28,),
                  Text('Safe and Secure',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                ],
              ),
             Image.asset('assets/images/safe and secure.png',height: 310,width: 320,)
            ],
          ),
        ),
      ),
    ];
    return slideList;
  }
}
