import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});

  void sharePressed(){
    String message = newsUrl;

    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeInImage.assetNetwork(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/img/placeholder.jfif",
            image: imgUrl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Text(
              newsHead.length > 90
                  ? "${newsHead.substring(0, 90)}..."
                  : newsHead,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsDes,
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              newsCnt != "--"
                  ? newsCnt.length > 250
                  ? newsCnt.substring(0, 250)
                  : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                  : newsCnt,
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                child: IconButton(
                  onPressed: sharePressed,
                  icon: Icon(Icons.share, color: Colors.red,),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  // color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailViewScreen(newsUrl: newsUrl)));
                  },
                  child: Text("Read More"),
                  style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),

                      padding: MaterialStateProperty.all(EdgeInsets.all(2)),

                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
                ),
              ),
            )






          ],
        ),


        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       // child:,
        //       child: IconButton(onPressed: sharePressed, icon: Icon(Icons.share,color: Colors.blueAccent,),)
        //     )],
        // ),



        SizedBox(
          height: 5,
        ),




        //
        //
        Center(
          child: TextButton(
            onPressed: () async {
              await launchUrl(Uri.parse("https://newsapi.org/"));
            },
            child: Text(
              "News Provided By NewsAPI.org",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ),


        //
      ]),
    );
  }
}

//       Spacer(),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             child: ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) =>
  //                               DetailViewScreen(newsUrl: newsUrl)));
  //                 },
  //                 child: Text("Read More")),
  //           ),
  //         ],
  //       ),
  //       Center(
  //           child: TextButton(
  //               onPressed: () async {
  //                 await launchUrl(Uri.parse("https://newsapi.org/"));
  //               },
  //               child: Text(
  //                 "News Provided By NewsAPI.org",
  //                 style: TextStyle(fontSize: 12),
  //                 textAlign: TextAlign.center,
  //               ))),
  //       SizedBox(
  //         height: 20,
  //       ),
  //     ]),
  //   );
  // }
// }
