import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'details_Screen';
  final String subscription;
  final String fiscalYear;
  final String paymentDate;
  final String paymentAmount;
  final String paymentMode;
  const DetailsScreen(
      {required this.subscription,
      required this.fiscalYear,
      required this.paymentDate,
      required this.paymentAmount,
      required this.paymentMode});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscription :' + widget.subscription,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'FiscalYear :' + widget.fiscalYear,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'PaymentDate :' + widget.paymentDate,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'PaymentAmount :' + widget.paymentAmount,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'paymentMode :' + widget.paymentMode,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
