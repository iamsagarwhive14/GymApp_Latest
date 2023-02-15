import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/PaymentHistory.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/screens/details_screen.dart';
import 'package:provider/provider.dart';

import '../services/shimmer/shimmereffect.dart';

class PaymentHistory extends StatefulWidget {
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            title: const Text(
              'Payment History',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 40),
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
                    print(snapshot.data?.result!.length);
                    return ListView.builder(
                      itemCount: snapshot.data!.result!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                child: Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
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
                                                      paymentDate: snapshot!
                                                              .data
                                                              ?.result![index]
                                                              .fiscalYear ??
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'assets/images/unnamed.png'))),
                                                margin:
                                                    const EdgeInsets.all(10),
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
                                                  Container(
                                                    width: 100,
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.cyanAccent
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Active',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    'Subscription:${snapshot!.data?.result![index].subscription}' ??
                                                        ' ',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Fiscal Year :${snapshot!.data?.result![index].fiscalYear}' ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ShimmerEffect();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
