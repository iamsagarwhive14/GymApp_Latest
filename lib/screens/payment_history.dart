import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/PaymentHistory.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/screens/details_screen.dart';
import 'package:provider/provider.dart';

class PaymentHistory extends StatefulWidget {
  static const String routeName = 'paymentHistory_screen';
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  )),
              height: 60.0,
              width: 300,
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(15),
              child: const Center(
                child: Text(
                  'Payment History',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background image.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<PaymentHistoryProvider>(
            builder: (context, dataprovider, child) {
              return FutureBuilder<PaymentHistoryData?>(
                future: dataprovider.paymentHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot);
                    return ListView.builder(
                      itemCount: snapshot.data!.result!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Flexible(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                subscription: snapshot!
                                                        .data
                                                        ?.result![index]
                                                        .subscription ??
                                                    '',
                                                fiscalYear: snapshot!
                                                        .data
                                                        ?.result![index]
                                                        .fiscalYear ??
                                                    '',
                                                paymentDate:
                                                    snapshot!.data?.result![index].fiscalYear ??
                                                        '',
                                                paymentAmount: snapshot!
                                                        .data
                                                        ?.result![index]
                                                        .paymentAmount ??
                                                    '0.0',
                                                paymentMode: snapshot!
                                                        .data
                                                        ?.result![index]
                                                        .paymentMode ??
                                                    '')));
                                  },
                                  child: Card(
                                    elevation: 20.0,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  'assets/images/noun_calories_1180285.png'),
                                            ),
                                            const SizedBox(
                                              width: 12.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 18.0,
                                                ),
                                                const Text(
                                                  'Active Subscription',
                                                  style: TextStyle(
                                                    color: Color(0xFF00F0FF),
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  'Subscription:${snapshot!.data?.result![index].subscription}' ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Fiscal Year :${snapshot!.data?.result![index].fiscalYear}' ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Payment Date :${snapshot!.data?.result![index].fiscalYear}' ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                const Text(
                                                  'Start Date:2022/02/04 ',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                const Text(
                                                  'End Date:2022/02/04 ',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Payment amount :${snapshot!.data?.result![index].paymentAmount}' ??
                                                    '',
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Payment Mode :${snapshot!.data?.result![index].paymentMode}' ??
                                                    '',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.all(8),
                            //   padding: const EdgeInsets.all(8),
                            //   child: Card(
                            //     elevation: 20.0,
                            //     color: Colors.white,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //     ),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //           children: [
                            //             const Image(
                            //               image: AssetImage(
                            //                   'assets/images/noun_calories_1180285.png'),
                            //             ),
                            //             const SizedBox(
                            //               width: 18.0,
                            //             ),
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: const [
                            //                 Text(
                            //                   'Active Subscription',
                            //                   style: TextStyle(
                            //                     color: Color(0xFF00F0FF),
                            //                     fontWeight: FontWeight.w900,
                            //                     fontSize: 20.0,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 10.0,
                            //                 ),
                            //                 Text(
                            //                   '1 Month Gym + Physical fitness ',
                            //                   style: TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 15.0,
                            //                     fontWeight: FontWeight.bold,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'Start Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'End Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //         Container(
                            //           padding: const EdgeInsets.all(8),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: const [
                            //               Text('Paid Amount:Rs 2500'),
                            //               SizedBox(
                            //                 width: 10.0,
                            //               ),
                            //               Text(
                            //                 'Due Amount:Rs 2500',
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.all(8),
                            //   padding: EdgeInsets.all(8),
                            //   child: Card(
                            //     elevation: 20.0,
                            //     color: Colors.white,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //     ),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Image(
                            //               image: AssetImage(
                            //                   'assets/images/noun_calories_1180285.png'),
                            //             ),
                            //             const SizedBox(
                            //               width: 18.0,
                            //             ),
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Text(
                            //                   'Inactive Subscription',
                            //                   style: TextStyle(
                            //                     color: Colors.red,
                            //                     fontWeight: FontWeight.w900,
                            //                     fontSize: 20.0,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 10.0,
                            //                 ),
                            //                 Text(
                            //                   '1 Month Gym + Physical fitness ',
                            //                   style: TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 15.0,
                            //                     fontWeight: FontWeight.bold,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'Start Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'End Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //         Container(
                            //           padding: EdgeInsets.all(8),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: const [
                            //               Text('Paid Amount:Rs 2500'),
                            //               SizedBox(
                            //                 width: 10.0,
                            //               ),
                            //               Text(
                            //                 'Due Amount:Rs 2500',
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.all(8),
                            //   padding: EdgeInsets.all(8),
                            //   child: Card(
                            //     elevation: 20.0,
                            //     color: Colors.white,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //     ),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Image(
                            //               image: AssetImage(
                            //                   'assets/images/noun_calories_1180285.png'),
                            //             ),
                            //             SizedBox(
                            //               width: 18.0,
                            //             ),
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: const [
                            //                 Text(
                            //                   'Inactive Subscription',
                            //                   style: TextStyle(
                            //                     color: Colors.red,
                            //                     fontWeight: FontWeight.w900,
                            //                     fontSize: 20.0,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 10.0,
                            //                 ),
                            //                 Text(
                            //                   '1 Month Gym + Physical fitness ',
                            //                   style: TextStyle(
                            //                     color: Colors.black,
                            //                     fontSize: 15.0,
                            //                     fontWeight: FontWeight.bold,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'Start Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //                 Text(
                            //                   'End Date:2022/02/04 ',
                            //                   style: TextStyle(
                            //                     color: Colors.grey,
                            //                     fontSize: 13.0,
                            //                     fontWeight: FontWeight.w700,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5.0,
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //         Container(
                            //           padding: const EdgeInsets.all(8),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: const [
                            //               Text('Paid Amount:Rs 2500'),
                            //               SizedBox(
                            //                 width: 10.0,
                            //               ),
                            //               Text(
                            //                 'Due Amount:Rs 2500',
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.lightBlueAccent,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _selectedIndex,
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.blue,
        //   onTap: (index) => setState(
        //     () => _selectedIndex = index,
        //   ),
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.location_history_outlined,
        //       ),
        //       label: 'History',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.account_circle,
        //       ),
        //       label: 'profile',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.map,
        //       ),
        //       label: 'Measurement',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.production_quantity_limits_sharp,
        //       ),
        //       label: 'Products',
        //     ),
        //   ],
        //   backgroundColor: Colors.white,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xFF00F0FF),
        //   onPressed: () {},
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        //   el
      ),
    );
  }
}
