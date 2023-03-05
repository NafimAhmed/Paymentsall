



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

import '../../utils/app_layout.dart';

class CardStatus extends StatelessWidget{

  List<String> _processes=['initiate','processing','ready','Delivered'];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [




            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back,color: Colors.black,)),
                const Text('Delivary status',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),




            Container(

              width: AppLayout.getScreenWidth(),


              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),



              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Collecting point :",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),


                  Text("Branch name",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Location")

                ],
              ),
            ),


            Container(

              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(05),vertical: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text(" Card Status :",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Container(
                    height: 120,
                    //alignment: Alignment.topCenter,
                    child: Timeline.tileBuilder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      theme: TimelineThemeData(
                        direction: Axis.horizontal,
                        connectorTheme: ConnectorThemeData(space: 8.0, thickness: 2.0),
                      ),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemCount: _processes.length,
                        itemExtentBuilder: (_, __) {
                          return (AppLayout.getScreenWidth() - 40) / 4.0;
                        },
                        oppositeContentsBuilder: (context, index) {
                          return Container();
                        },
                        contentsBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _processes[index],
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          );
                        },
                        indicatorBuilder: (_, index) {

                          if (index <= 1) {
                            return DotIndicator(
                              size: 20.0,
                              color: Colors.green,
                            );
                          } else {
                            return OutlinedDotIndicator(
                              borderWidth: 4.0,
                              color: Colors.green,
                            );
                          }
                        },
                        connectorBuilder: (_, index, type) {
                          if (index > 0) {
                            return SolidLineConnector(
                              color: Colors.green,
                            );
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  )

                ],
              ),
            )










          ],
        ),
      ),
    );
  }

}