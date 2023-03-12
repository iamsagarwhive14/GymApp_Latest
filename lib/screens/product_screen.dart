import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_mgmtsystem/model/product/ProductModel.dart';
import 'package:gym_mgmtsystem/providers/product_provider.dart';
import 'package:gym_mgmtsystem/screens/product/product_details.dart';
import 'package:provider/provider.dart';

import '../services/shimmer/shimmereffectproduct.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = 'product_screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(left: 5, top: 10),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: TextFormField(
                          // controller: idController,
                          decoration: const InputDecoration(
                            hintText: 'Enter product Name',
                            contentPadding: EdgeInsets.all(17),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? ' ' : null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          'View Product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Consumer<ProductProvider>(
                  builder: (context, dataProvider, child) {
                    return FutureBuilder<ProductModel?>(
                        future: dataProvider.productData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: dataProvider
                                    .apiResult?.result.products.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                    name: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .name ??
                                                        'saguaro',
                                                    description: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .description ??
                                                        'saguaro',
                                                    price: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .price ??
                                                        'saguaro',
                                                    image: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .image ??
                                                        'saguaro',
                                                    createdAt: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .createdAt ??
                                                        'saguaro',
                                                    updatedAt: dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .updatedAt ??
                                                        'saguaro',
                                                    productId: (dataProvider
                                                                .apiResult
                                                                ?.result
                                                                .products[index]
                                                                .id ??
                                                            'saguaro')
                                                        .toString(),
                                                  )));
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.antiAlias,
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                dataProvider
                                                        .apiResult
                                                        ?.result
                                                        .products[index]
                                                        .image ??
                                                    'saguaro',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.11,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // borderRadius: BorderRadius.only(
                                              //     bottomRight: Radius.circular(10),
                                              //     bottomLeft: Radius.circular(10))
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    dataProvider
                                                            .apiResult
                                                            ?.result
                                                            .products[index]
                                                            .name ??
                                                        'saguaro',
                                                    style: GoogleFonts.openSans(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Align(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    // margin: EdgeInsets.only(
                                                    //     left: 5),
                                                    child: Text(
                                                        dataProvider
                                                                .apiResult
                                                                ?.result
                                                                .products[index]
                                                                .price ??
                                                            'saguaro',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.redAccent,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return ShimmerEffectProduct();
                          }
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
