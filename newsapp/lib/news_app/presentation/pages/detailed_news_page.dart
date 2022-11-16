import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/presentation/cubit/homepage_cubit.dart';
import '../../data/models/articles_model.dart';

class DetailedNewsPage extends StatelessWidget {
  DetailedNewsPage({Key? key, required this.articles}) : super(key: key);
  Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: NewsAppColors.lightBlue,
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
              collapsedHeight: 140.0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(6.0),
                  title: Text(
                    articles.title ?? 'Title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 12,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.detailedPageNewsTitle.copyWith(
                        fontSize: 18, backgroundColor: Colors.black45),
                  ),
                  background: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.53,
                    width: double.infinity,
                    child: Image.network(
                      articles.urlToImage ??
                          'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
                      fit: BoxFit.cover,
                    ),
                  )
              )
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (BuildContext context, int index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ColoredBox(
                    color: NewsAppColors.lightBlue50,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(articles.author ?? 'Unknown Author',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(Icons.calendar_month),
                                      ),
                                      Text(
                                          articles.publishedAt!
                                              .substring(0, 10),
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            articles.description ?? 'Unknown',
                            style: AppTextStyles.newsDescription,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            articles.content ?? 'No content available',
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.newsDescription
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                          TextButton(
                            onPressed: () async {
                              BlocProvider.of<HomepageCubit>(context)
                                  .launchURL(articles.url);
                            },
                            child: Text('Go to source '),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )
        // Stack(
        //   children: [
        //     Container(
        //       height: MediaQuery.of(context).size.height * 0.53,
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: NetworkImage(articles.urlToImage??'https://media.istockphoto.co
        //           m/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x
        //           612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='),fit: BoxFit.fitHeight,
        //         )
        //       ),
        //       child: Column(
        //         //mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(25.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 GestureDetector(
        //                   onTap:(){
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: Stack(alignment: Alignment.center, children: [
        //                     ClipRRect(
        //                       borderRadius: BorderRadius.circular(10.0),
        //                       child: BackdropFilter(
        //                         filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
        //                         child: SizedBox(
        //                           height: 40.0,
        //                           width: 40.0,
        //                           child: DecoratedBox(
        //                             decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(10.0)),
        //                             child: ColoredBox(color: Colors.white.withOpacity(0.5),),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Icon(
        //                       Icons.arrow_back_ios,
        //                       color: NewsAppColors.accentColor,
        //                     )
        //                   ]),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           SizedBox(height: MediaQuery.of(context).size.height*0.12,),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 60.0),
        //             child: Text(articles.title??'Title',
        //               overflow:TextOverflow.ellipsis,
        //               maxLines:12,textAlign: TextAlign.justify,
        //               style: AppTextStyles.detailedPageNewsTitle.copyWith(fontSize: 24,backgroundColor: Colors.black45),),
        //           ),
        //         ],
        //       ),
        //     ),
        //
        //
        //
        //
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
        //         child: SizedBox(
        //           height: MediaQuery.of(context).size.height * 0.53,
        //           width: double.infinity,
        //           child: ColoredBox(
        //             color: NewsAppColors.lightBlue50,
        //             child: SingleChildScrollView(
        //               child: Padding(
        //                 padding: const EdgeInsets.all(20.0),
        //                 child: Column(
        //
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.all(10.0),
        //                       child: Align(alignment: Alignment.topRight,
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.end,
        //                           children: [
        //                             Text(articles.author??'Unknown Author',
        //                                 style: TextStyle(fontSize: 16,)),
        //                             Row(
        //                               mainAxisAlignment: MainAxisAlignment.end,
        //                               children: [
        //                                 const Padding(
        //                                   padding: EdgeInsets.all(2.0),
        //                                   child: Icon(Icons.calendar_month),
        //                                 ),
        //                                 Text(articles.publishedAt!.substring(0,10),textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,)),
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                     Text(articles.description??'Unknown',
        //                       style: AppTextStyles.newsDescription,),
        //                     const SizedBox(height: 10.0,),
        //                     Text(articles.content??'No content available',textAlign: TextAlign.justify,
        //                       style: AppTextStyles.newsDescription.copyWith(fontWeight: FontWeight.normal),),
        //                     TextButton(
        //                       onPressed: () async {
        //                         BlocProvider.of<HomepageCubit>(context).launchURL(articles.url);
        //                       },
        //                       child:  Text('Go to source '),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
