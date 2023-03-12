import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_mgmtsystem/screens/newsScreen/news_details_screen.dart';
import 'package:gym_mgmtsystem/utilities/constant.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2d5d7b),
        title: Center(
            child: Text(
          ' Breaking News',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, dataProvider, child) {
          return FutureBuilder(
              future: dataProvider.newsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: dataProvider.apiResult!.result!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailsScreen(
                                      imgUrl: Constants.imageurl +
                                          dataProvider
                                              .apiResult!.result![index].image
                                              .toString(),
                                      title: dataProvider
                                          .apiResult!.result![index].title
                                          .toString(),
                                      description: dataProvider
                                          .apiResult!.result![index].description
                                          .toString(),
                                      publishedDate: dataProvider
                                          .apiResult!.result![index].publishDate
                                          .toString(),
                                      source: dataProvider
                                          .apiResult!.result![index].source
                                          .toString(),
                                    )));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                Constants.imageurl +
                                                    dataProvider.apiResult!
                                                        .result![index].image
                                                        .toString())),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          dataProvider
                                              .apiResult!.result![index].title
                                              .toString(),
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    dataProvider
                                        .apiResult!.result![index].description
                                        .toString(),
                                    // 'In Flutter, the overflow property of the Text, RichText, and DefaultTextStyle widgets specifies how overflowed content that is not displayed should be signaled to the user. It can be clipped, display an ellipsis (three dots), fade, or overflowing outside its parent widget.',
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        'Source: ' +
                                            dataProvider.apiResult!
                                                .result![index].source
                                                .toString(),
                                        // 'In Flutter, the overflow property of the Text, RichText, and DefaultTextStyle widgets specifies how overflowed content that is not displayed should be signaled to the user. It can be clipped, display an ellipsis (three dots), fade, or overflowing outside its parent widget.',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        'PublishDate: ' +
                                            dataProvider.apiResult!
                                                .result![index].publishDate
                                                .toString(),
                                        // 'In Flutter, the overflow property of the Text, RichText, and DefaultTextStyle widgets specifies how overflowed content that is not displayed should be signaled to the user. It can be clipped, display an ellipsis (three dots), fade, or overflowing outside its parent widget.',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        },
      ),
    );
  }
}
