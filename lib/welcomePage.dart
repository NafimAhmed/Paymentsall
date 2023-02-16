import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: GFIntroScreen(
          height: 450,
         // height: MediaQuery.of(context).size.height * 0.7,
          //width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.white,
         // borderRadius: BorderRadius.circular(40),
         // border: Border.all(color: Colors.grey),
          slides: slides(),
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          backButtonText: 'Previous',
          forwardButtonText: 'Next',
          skipButtonText: 'Skip',
          doneButtonText: 'Done',
         // navigationBarHeight: 50,
         // navigationBarWidth: 300,
         //  navigationBarShape: RoundedRectangleBorder(
         //    side: BorderSide(color: Colors.blue,width: 4),
         //    borderRadius: BorderRadius.circular(60),
         //  ),
          navigationBarColor: Colors.white,
          showDivider: false,
          dotHeight: 10,
          dotWidth: 12,
          dotShape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey,width: 1),
           // borderRadius: BorderRadius.circular(3)
    ),
          inactiveColor: Colors.grey,
          activeColor: GFColors.SUCCESS,
          dotMargin: EdgeInsets.symmetric(horizontal: 6),
          showPagination: true,
        ),
      ),
    );

  }
  List<Widget>slides(){
    slideList=[
      Container(
        child: GFImageOverlay(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 25),
                ),
              ),
            ],
          ),
          color: Colors.orange,
          image: const AssetImage('assets/images/WelcomeImage.png'),
          boxFit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage('assets/images/Transfer Money Via online.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage('assets/images/Safe & Secure.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage('assets/images/Safe & Secure.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            )),
      ),
    ];
    return slideList;
  }

}

