import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_mgmtsystem/model/measurement/Measurement_model.dart';
import 'package:provider/provider.dart';
import '../providers/measurement_provider.dart';
import '../services/shimmer/shimmereffectmeasurement.dart';

class MeasurementScreen extends StatelessWidget {
  static const String routeName = 'measurement_screen';
  final String id;
  const MeasurementScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Measurement',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF2d5d7b),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<MeasurementProvider>(
          builder: (context, dataprovider, child) {
            return FutureBuilder<MeasurementModel?>(
              future: dataprovider.measurementData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.result!.length);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.result!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Flexible(
                                child: Card(
                                  elevation: 10.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: const Image(
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/bodyimage.png'),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 18.0,
                                              ),
                                              Text(
                                                'Date:${snapshot!.data?.result![index].date}' ??
                                                    '',
                                                style: GoogleFonts.openSans(
                                                  color:
                                                      const Color(0xFF2d5d7b),
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFF2d5d7b),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                                child: Center(
                                                  child: Text(
                                                    'bicep:${snapshot!.data?.result![index].bicep}' ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFF2d5d7b),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                                child: Center(
                                                  child: Text(
                                                      'calf :${snapshot!.data?.result![index].calf}' ??
                                                          '',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFF2d5d7b),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                                child: Center(
                                                  child: Text(
                                                    'chest :${snapshot!.data?.result![index].chest}' ??
                                                        '',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFF2d5d7b),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                                child: Center(
                                                  child: Text(
                                                    'Forearm :${snapshot!.data?.result![index].forearm}' ??
                                                        '',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFF2d5d7b),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                                child: Center(
                                                  child: Text(
                                                    'Hips :${snapshot!.data?.result![index].hips}' ??
                                                        '',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
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
                                            Container(
                                              height: 25,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF2d5d7b),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: Text(
                                                  'Weight :${snapshot!.data?.result![index].weight}' ??
                                                      '',
                                                  style: GoogleFonts.openSans(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Container(
                                              height: 25,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF2d5d7b),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: Text(
                                                  'Waist :${snapshot!.data?.result![index].waist}' ??
                                                      '',
                                                  style: GoogleFonts.openSans(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                    ),
                  );
                } else {
                  return ShimmerEffectMeasurement();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
