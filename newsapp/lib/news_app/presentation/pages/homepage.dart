import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/base/base_state.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/presentation/cubit/homepage_cubit.dart';
import 'package:newsapp/news_app/presentation/pages/search_page.dart';
import 'package:newsapp/news_app/presentation/widgets/HeadlinesWidget.dart';
import 'package:newsapp/utils/app_consts.dart';
import 'package:newsapp/utils/enums/categories.dart';
import 'package:newsapp/utils/enums/countries.dart';

import '../../../injection_container.dart';
import '../widgets/tab_view_widget.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  //final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final homepageCubit = sl<HomepageCubit>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomepageCubit, BaseState>(
      bloc: BlocProvider.of<HomepageCubit>(context)..getTopHeadlines(),
      builder: (context, state) {
        // var homepageCubit = BlocProvider.of<HomepageCubit>(context);
        if (state is StateOnSuccess) {
          HomepageState stateResponse = state.response as HomepageState;
          return Scaffold(
            backgroundColor: Colors.amber[300],
            body: DefaultTabController(
              length: categories.values.length,
              child: Builder(builder: (BuildContext context) {
               final  TabController? tabController = DefaultTabController.of(context);
                tabController?.addListener(() {
                  if (!tabController.indexIsChanging) {
                    print('before method called $state');
                    homepageCubit.getNewsBycategories(index : tabController.index);

                  }
                });
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, top: 20.0, left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Builder(builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        countryFilter: countries.values
                                            .map((e) => e.name)
                                            .toList(),
                                        context: context,
                                        showPhoneCode: false,
                                        favorite: ['in'],
                                        showSearch: true,
                                        onSelect: (Country country) {
                                          homepageCubit.defaultCountryCode =
                                              country.countryCode.toLowerCase();
                                          //homepageCubit.isCountrySelected = true;
                                          homepageCubit.countryName =
                                              country.name;
                                          homepageCubit.getTopHeadlines();
                                        },
                                      );
                                    },
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              width: 40.0,
                                              child: ColoredBox(
                                                color: NewsAppColors.colorBlue,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.flag,
                                            color: NewsAppColors.accentColor,
                                          )
                                        ]),
                                  );
                                }),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Select Country'),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SearchPage()));
                              },
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: SizedBox(
                                    height: 40.0,
                                    width: 40.0,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: ColoredBox(
                                          color: Colors.blue.shade50,
                                        )),
                                  ),
                                ),
                                Icon(Icons.search,
                                    color: NewsAppColors.accentColor)
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
                            itemCount: stateResponse.headlinesList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(
                                  'List ::::: ${stateResponse.headlinesList?.length}');

                              return HeadLinesWidget(
                                // title: stateResponse[index].title??'title',
                                // author: stateResponse[index].author??"Not Recognised",
                                // publishedAt: stateResponse[index].publishedAt??'No date',
                                // urlToImage: stateResponse[index].urlToImage!,
                                articles: stateResponse.headlinesList![index],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 80.0,
                        child: TabBar(
                          onTap: (int index) {
                            //print('tapped ::::: ${stateResponse.headlinesList?.length}===== index:::::$index');
                            // homepageCubit.defaultCategory =
                            //     categories.values[index].name;
                            //print(homepageCubit.defaultCategory);
                            //homepageCubit.isUpdated = !homepageCubit.isUpdated;
                            //homepageCubit.getNewsBycategories();
                          },
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.only(left: 20.0),
                          indicatorColor: Colors.blue[800],
                          unselectedLabelColor: Colors.grey,
                          tabs: List.generate(categories.values.toList().length,
                              (index) {
                            return Text(
                                categories.values[index].name[0].toUpperCase() +
                                    categories.values[index].name
                                        .substring(1)
                                        .toLowerCase(),
                                style: TextStyle(fontSize: 30));
                          }),
                        ),
                      ),
                      BlocBuilder<HomepageCubit, BaseState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.88, //height for tabbar screens
                            child: TabBarView(children: [
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                              BlocBuilder<HomepageCubit, BaseState>(
                                builder: (context, state) {
                                  return TabViewListWidget(
                                      newsByCategoryList:
                                          stateResponse.newsByCategoriesList ??
                                              []);
                                },
                              ),
                            ]),
                          );
                        },
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        } else if (state is StateInitial) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
              body: Center(
                  child: Text('Oops! some error occured while loading data!')));
        }
      },
    );
  }
}
