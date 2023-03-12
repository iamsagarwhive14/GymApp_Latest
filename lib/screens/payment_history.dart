import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_mgmtsystem/model/PaymentHistory.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/screens/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shimmer/shimmereffect.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  String gymLogo = '';
  @override
  void initState() {
    super.initState();
    getGymLogoSharedPreference();
  }

  Future<void> getGymLogoSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      gymLogo = sharedPreferences.getString('logo') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: const Color(0xFF2d5d7b),
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
                                padding: const EdgeInsets.all(7.0),
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
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          NetworkImage(gymLogo)
                                                      // AssetImage('assets/images/unnamed.png'),
                                                      ),
                                                ),
                                                margin: const EdgeInsets.all(5),
                                              ),
                                              const SizedBox(
                                                width: 8.0,
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
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    snapshot!
                                                            .data
                                                            ?.result![index]
                                                            .subscription ??
                                                        ' ',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Fiscal Year :${snapshot!.data?.result![index].fiscalYear}' ??
                                                        '',
                                                    style: GoogleFonts.openSans(
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
                                                    style: GoogleFonts.openSans(
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
                                                    'Start Date:2022/02/04 ',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.grey,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'End Date:2022/02/04 ',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.grey,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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
