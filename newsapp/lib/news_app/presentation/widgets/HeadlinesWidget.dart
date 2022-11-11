import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/presentation/pages/detailed_news_page.dart';

class HeadLinesWidget extends StatelessWidget {
   HeadLinesWidget({Key? key,
     required this.articles,
     // required this.publishedAt,
     // required this.author,
     // required this.title,
     // required this.urlToImage
   }) : super(key: key);

  // final String urlToImage;
  // String title;
  // String author;
  // String publishedAt;
  Articles articles;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedNewsPage(
          articles: articles,
          )));
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
                    child: Image.network(
                      articles.urlToImage??'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, _, __) =>
                        Image.asset('assets/images/placeholder.png'),
                    )),
              ),

              Positioned(
                bottom: 0.0,
                left: 4,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(30.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
                              child: Text(articles.title??'Title',
                                style: AppTextStyles.homepageNewsTitle,textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(articles.author??'Author unknown',overflow:TextOverflow.ellipsis,style: AppTextStyles.homepageNewsAuthor),
                                  Text(articles.publishedAt!.substring(0,10),overflow:TextOverflow.ellipsis,style: AppTextStyles.homepageNewsAuthor),
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
