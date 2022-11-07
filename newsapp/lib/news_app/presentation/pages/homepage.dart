import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/presentation/pages/search_page.dart';
import 'package:newsapp/news_app/presentation/widgets/HeadlinesWidget.dart';
import 'package:newsapp/utils/app_consts.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  //TabController _tabController = TabController(length: 3, vsync: this);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              ListTile(title: Text('Find news from different Countries')),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(itemCount:5,itemBuilder: (BuildContext context,int index){
                  return ListTile(title: Text('HI, I am Drawer tile'),);
                }),
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0,top: 20.0,left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap:(){
                            Scaffold.of(context).openDrawer();
                          },
                          child: Stack(
                              alignment: Alignment.center,
                              children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: ColoredBox(
                                  color: NewsAppColors.colorBlue,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.menu,
                              color: NewsAppColors.accentColor,
                            )
                          ]),
                        );
                      }
                    ),
            GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Stack(
                alignment: Alignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: ColoredBox(
                        color: Colors.blue.shade50,
                      )),
                ),
              ),
              Icon(Icons.search, color: NewsAppColors.accentColor)
            ]),
          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppConstants.breakingNews,
                      style: AppTextStyles.mainHeadLine,
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return HeadLinesWidget();
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 80.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.blue[800],
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Text('1st', style: TextStyle(fontSize: 30,)),
                      Text('2nd', style: TextStyle(fontSize: 30)),
                      Text('3rd', style: TextStyle(fontSize: 30)),
                      Text('4th', style: TextStyle(fontSize: 30)),
                      Text('5th', style: TextStyle(fontSize: 30)),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height, //height for tabbar screens
                child: TabBarView(
                    children: [
                      FirstScreen(),
                      SecondScreen(),
                      ThirdScreen(),
                      Fourth(),
                      Fifth()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
            style: TextStyle(fontSize: 32.0),
          )
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('It is a second layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('It is a third layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }}

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('It is a fourth layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }}

class Fifth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('It is a fifth layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }}