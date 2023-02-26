import 'package:flutter/material.dart';
 class Bill_Receipt{
   final List<BillDetails>billDetailsList;
   Bill_Receipt( this.billDetailsList);
 }

class BillDetails {
   final String description;
   final String others;

   BillDetails(this.description,this.others);
}
 class Payment_Receipt{
   final List<PaymentDetails>paymentDetailsList;
   Payment_Receipt(this.paymentDetailsList);
 }

class PaymentDetails {
  final String description;
  final String others;

  PaymentDetails(this.description,this.others);

}

final receipts=[
  BillDetails('Organization Name', 'DESCO(Postpaid)'),
  BillDetails('Bill Month', 'January, 2023'),
  BillDetails('Bill Account Number', '35022942'),
  BillDetails('Bill Amount', 'BDT 1121.00'),

  PaymentDetails('Payment Date', '22 February, 2023'),
  PaymentDetails('PaymentsAll Account', '017XXXXXXXX'),
  PaymentDetails('Transaction Id', 'AMB4G5J7K6FF'),
  PaymentDetails('Paid to Organization', 'BDT 1121.00'),
  PaymentDetails('PaymentsAll Fee', 'BDT 0.00'),
];


class RecentTransactionPDF extends StatefulWidget {
  const RecentTransactionPDF({Key? key}) : super(key: key);

  @override
  State<RecentTransactionPDF> createState() => _RecentTransactionPDFState();
}

class _RecentTransactionPDFState extends State<RecentTransactionPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
