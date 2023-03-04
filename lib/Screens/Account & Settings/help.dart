import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Text('Help',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.red.shade100, width: 0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0.0,
           margin: EdgeInsets.all(16),
            child: ListTile(
              title: Text('Who can open a PaymentsAll Account?',
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text('- Bangladeshi National\n - Age 18 years or above\n - Having a valid Photo national ID/Passport/Driving License\n - Currently Robi, Grameenphone, Banglalink, Teletalk and Airtel subscribers',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        },

      ),

    );
  }
}
