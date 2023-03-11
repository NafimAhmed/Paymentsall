import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';
import 'package:timelines/timelines.dart';

import 'E_loanConfirmetion.dart';



class TimeLine{
  final List<TimeLineDetails>timeLineDetailsList;
  TimeLine( this.timeLineDetailsList);
}

class TimeLineDetails {
  final String date;
  final String year;
  final String money;
  final String interest;

  TimeLineDetails(this.date,this.year,this.money,this.interest);
}

class ELoanDetailsPage extends StatelessWidget {
   ELoanDetailsPage({Key? key}) : super(key: key);
   
   
   final details=[
     TimeLineDetails('Oct 11', '2023', '1016.96', 'Main 989.23 + Interest 27.75'),
     TimeLineDetails('Nov 11', '2023', '1016.96', 'Main 1001.38 + Interest 15.58'),
     TimeLineDetails('Dec 11', '2023', '1016.98', 'Main 1001.41 + Interest 7.57'),
   ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Row(
          children: [
            Text('E-Loan',style: TextStyle(color: Colors.black)),
            Spacer(),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Icon(
                              Icons.hexagon,color: Color(0xFFE57373),
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: const Icon(
                              Icons.star,color: Colors.white,size: 14,
                            ),

                          ),
                        ),

                      ],
                    ),
                    Text('0 Points',style: TextStyle(color: Colors.red.shade900)),
                  ],
                ))
          ],
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      backgroundColor: Color(0xFFFFF8F8),


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: AppLayout.getWidth(320),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    children: [
                      Text('E-Loan Giver'),
                      Spacer(),
                      Image.asset('assets/images/Payments_All_Logo.png',height: AppLayout.getHeight(70),width: AppLayout.getWidth(100),)
                    ],
                  ),
                ) ,
                Divider(color: Color(0xFFFFF8F8),thickness: 4,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Reimbursement Date',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                      Spacer(),
                      Text('Every Month 11th',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ),
                      )
                    ],
                  ),
                ),
                Divider(color: Color(0xFFFFF8F8),thickness: 4,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount Details',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                      Text('E-Loan Took ৳3,000.00',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                      Text('Charge Fees ৳21.00',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                      Row(
                        children: [
                          Text('Total Amount ',
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),
                          Text('৳2,931.00',
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xFFFFF8F8),thickness: 4,),
                Padding(padding: EdgeInsets.only(left: 8.0,right: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('E-Loan Payment Plan',
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Text('See All',
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
                            )
                        )
                      ],
                    ),
                    Text('Total Payable Amount ৳3,050.00',
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16
                      ),
                    ),
                    Text('Total Interest Amount ৳50.00',
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16
                      ),
                    ),
                    Text('Interest Rate 9.0%(per amount)',
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),

                ),

                Container(
                  child: Timeline.tileBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.start,
                    shrinkWrap: true,
                   // padding: EdgeInsets.all(5),
                    theme: TimelineThemeData(
                      nodePosition: 0.3,
                      direction: Axis.vertical,
                      connectorTheme: ConnectorThemeData(space: 10.0, thickness: 2.0,),
                    ),

                    builder: TimelineTileBuilder.connected(
                      contentsAlign: ContentsAlign.basic,
                      connectionDirection: ConnectionDirection.before,
                      itemCount: details.length,
                        itemExtentBuilder: (_, __){
                          return (AppLayout.getScreenWidth() - 30) / 3.0;
                        },
                        oppositeContentsBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 35,),
                                Text(details[index].date,

                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                  ),
                                ),
                                Text(details[index].year,
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    //fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          );
                         },

                        contentsBuilder: (context, index){
                        return Padding(
                            padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 35,),
                            Text(details[index].money,

                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                              ),
                            ),
                            Text(details[index].interest,
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                              ),
                            ),
                          ],
                        ),
                        );
                        },
                      indicatorBuilder: (_, index) {

                        if (index <= 1) {
                          return DotIndicator(
                            size: 20.0,
                            color: Color(0xFFF59191),
                          );
                        } else {
                          return const DotIndicator(
                            size: 20.0,
                            //borderWidth: 4.0,
                            color: Color(0xFFF59191),
                          );
                        }
                      },   connectorBuilder: (_, index, type) {
                      if (index > 0) {
                        return SolidLineConnector(
                          color: Colors.red.shade200,
                        );
                      } else {
                        return null;
                      }
                    },

                    ),
                  ),
                ),

                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red.shade900
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
                            return EloanConfirmationpage();
                          },
                        ),
                      );

                    },
                    child: Row(
                      children: [
                        Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                        Spacer(),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
