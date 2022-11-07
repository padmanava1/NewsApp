import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';

class DetailedNewsPage extends StatelessWidget {
  const DetailedNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: NewsAppColors.lightBlue,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.53,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/HB.jpeg',),fit: BoxFit.cover,
              )
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.of(context).pop();
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
                              child: SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: ColoredBox(color: Colors.white.withOpacity(0.5),),
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: NewsAppColors.accentColor,
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Him,nskkl skhak skkxvdvd '
                      'sbdjkabskbdjkbask '
                      'News Title',
                    overflow:TextOverflow.ellipsis,
                    maxLines:4,
                    style: AppTextStyles.detailedPageNewsTitle,),
                ),
              ],
            ),
          ),




          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.53,
                width: double.infinity,
                child: ColoredBox(
                  color: NewsAppColors.colorWhite,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Author:::::::::::',
                                    style: TextStyle(fontSize: 16,)),
                                SizedBox(width: 30.0,),
                                Text('Published at:::::::::',textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,))
                              ],
                            ),
                          ),
                          Text('News Description :::::::::::::::::::::::::::::::::::::::::::',
                            style: AppTextStyles.newsDescription,),
                          SizedBox(height: 10.0,),
                          Text('See your content is fit or not.News Content\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\n'
                              'ahsvxhja\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\n'
                              'sbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\ns'
                              'bcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\ns'
                              'bcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj\nsbcjsbkc'
                              '\nahsvxhjagsj\nsbcjsbkc\nahsvxhjagsj',textAlign: TextAlign.justify,style: AppTextStyles.newsDescription.copyWith(fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
