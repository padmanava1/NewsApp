import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/presentation/pages/detailed_news_page.dart';
import '../../data/models/articles_model.dart';

class TabViewListWidget extends StatelessWidget {
   TabViewListWidget({Key? key, required this.newsByCategoryList}) : super(key: key);
  List<Articles> newsByCategoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsByCategoryList.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailedNewsPage(articles: newsByCategoryList[index])));
            },
            child: Card(
              color: NewsAppColors.lightBlue50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox(height: 150,width: 150,
                        child: Image.network(newsByCategoryList[index].urlToImage??'',
                        errorBuilder: (BuildContext context, _,
                            __) =>
                            Image.asset(
                                'assets/images/placeholder.png'),
                        fit: BoxFit.cover,),)),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(newsByCategoryList[index].title??'News Title',style: AppTextStyles.unselectedLabelStyle,maxLines: 6,overflow: TextOverflow.ellipsis,),
                ))
              ],
            ),
            ),
          );

        });
  }
}
