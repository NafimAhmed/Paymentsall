




import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/salary_payroll/salarypay_pin.dart';

import '../../utils/app_layout.dart';
import 'add_employee.dart';
import 'employee_detail.dart';

class SalaryDashBoard extends StatelessWidget {
  final String pin,phoneNumber,balance;

  RxDouble amt=0.00.obs;

  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rfup = FirebaseDatabase.instance.ref("User_profile");





  SalaryDashBoard({super.key, required this.pin, required this.phoneNumber, required this.balance});
  //const SalaryDashBoard({Key? key, required this.pin}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    String amount="100000";

    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(phoneNumber).child("Employee_List");

    //totalAmnt();


    rfup.child(phoneNumber).onValue.listen((event) {

      amt.value=0.00;
     totalAmnt();
    });




    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Salary Payroll',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),

      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: 345,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Total Salary amount : "),

                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" ৳ ${amt.value}",
                            style: GoogleFonts.openSans(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade900
                            ),
                          ),


                          InkWell(
                            onTap: (){

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SalaryPayPin(
                                      pin: pin,
                                      balance: balance,
                                      amount: amt.value.toString(),
                                      UserPhone: phoneNumber,
                                    );
                                  },
                                ),
                              );

                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                            ),
                          )



                        ],
                      ),),





                      Row(
                        children: [
                          Text("Available Balance : ",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Text("$balance",

                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,

                            ),

                          ),
                          Text(" ৳",

                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),

                          ),

                          //Icon(Icons.currency_lira)



                        ],
                      ),



                    ],
                  ),
                ),




                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  child: Column(
                    children: [

                      FirebaseAnimatedList(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        query: dbref,
                        reverse: true,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {


                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            child: ListTile(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EmployeeDetail(
                                        EmpName: '${snapshot.child("EmployeeName").value.toString()}',
                                        EmpDesig: "${snapshot.child("EmployeeDesignation").value.toString()}",
                                        EmpPhone: "${snapshot.child("EmployeePhoneNumber").value.toString()}",
                                        EmpSal: "${snapshot.child("EmployeeSalary").value.toString()}",
                                        UserPhone: phoneNumber,
                                      );
                                    },
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                                radius: 30,
                                backgroundColor: Colors.green.shade500,

                              ),
                              title: Text('${snapshot.child("EmployeeName").value.toString()}',
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Designation : ${snapshot.child("EmployeeDesignation").value.toString()}"),
                                  Text("Account Phone Number : ${snapshot.child("EmployeePhoneNumber").value.toString()}"),
                                  Text("Salary amount : ${snapshot.child("EmployeeSalary").value.toString()}"),
                                ],
                              ),

                            ),
                          );




                        },

                      )





                    ],
                  ),
                )




              ],
            ),
          ),




        ),
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddEmployee(
                    PhoneNumber: phoneNumber,
                  );
                },
              ),
            );

          },
          label: Text("Add\nEmployee"),
          hoverElevation: 100,
          icon: Icon(Icons.add),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),






    );
  }


  void totalAmnt(){

   // amt.value=amt.value+double.parse(amount);


    Query result = FirebaseDatabase.instance.ref("User_profile").child(phoneNumber).child("Employee_List");

    result.onValue.listen((event) {
      for (final i in event.snapshot.children) {
        amt.value=amt.value+double.parse(i.child("EmployeeSalary").value.toString());
      }
    }, onError: (error) {
      // Error.
    });









  }







}