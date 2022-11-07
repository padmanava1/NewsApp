import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/presentation/pages/detailed_news_page.dart';

class HeadLinesWidget extends StatelessWidget {
  const HeadLinesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedNewsPage()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: Stack(
            //fit: StackFit.passthrough,
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: SizedBox(
                    height: 500,
                    width: 300,
                    child: Image.asset(
                      'assets/images/HB.jpeg',
                      fit: BoxFit.cover,
                    )),
              ),

              Positioned(
                bottom: 0.0,
                left: 4,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(30.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
                              child: Text('News Title',
                                style: AppTextStyles.homepageNewsTitle,textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Author',style: AppTextStyles.homepageNewsAuthor),
                                  Text('Published at',style: AppTextStyles.homepageNewsAuthor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
