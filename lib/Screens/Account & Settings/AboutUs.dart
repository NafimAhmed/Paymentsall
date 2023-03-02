import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Text('About Us'),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('History of Payments All',

              style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(20),
              child: Text('bKash is a word that resonates with development, people’s prosperity and social growth.'
                  ' From its inception in 2011, bKash has become an integral part of the lives of millions today.'
                  ' Through fast, easy, and secure digital transactions, it has become a member of every household '
                  'in Bangladesh and the word “bKash” has become a verb. People now say “bKash koro (me)” instead of'
                  ' “send me money”. Catering to people’s daily transactional needs, it is empowering them to fulfill'
                  ' their dreams as well as taking the country forward.\n\nFinancial inclusion is in the DNA of bKash.'
                  ' Driving technological innovation and keeping compliance in all its dealings, the company has '
                  'been bringing wide range of services to empower the customers and bring freedom in their financial '
                  'transactions. Over the years, bKash has built a robust network of nearly 300,000 agents and 300,000 '
                  'merchants across the country. bKash also integrated with banks, financial institutions and service providers to '
                  'strengthen the cashless digital financial ecosystem of the country. As a result, bKash is now a '
                  'trusted platform to a large customer base of nearly 65 million.\n\nbKash, a joint venture of BRAC Bank, '
                  'US based Money in Motion LLC, International Finance Corporation of the World Bank Group, Bill and Melinda '
                  'Gates Foundation, Ant Group, and SoftBank Vision Fund, operates under the regulation of Bangladesh Bank.\n\n'
                  'With its exponential growth, the company has been recognized globally and locally. It was ranked as '
                  'the 23rd company in the annual list of Fortune Magazine’s “Change the World” in 2017 among the top 50 '
                  'companies across the world for making sustainable changes based on social issues. bKash has been awarded '
                  'as the country’s Best Brand for four consecutive years in 2019, 2020, 2021 and 2022 through consumer surveys '
                  'by Bangladesh Brand Forum. bKash also emerged as no. 1 “Employer of Choice” among major multinational and local '
                  'companies across all industries for three consecutive years in 2020, 2021 and 2022 by NielsenIQ’s Campus '
                  'Track Survey B-School. bKash has been honored as ‘Best Financial Institution of the year’ of 2021 for exemplary '
                  'contribution to the country’s financial inclusion by ‘DHL-The Daily Star - Bangladesh Business Awards’.'
                  ' For the first time as an MFS provider in the country, bKash has been honored as “Best for Digital Solutions in '
                  'Bangladesh” in 2022 by Asiamoney.',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
              ),
            )

          ],
        ),
      ),

    );
  }
}
