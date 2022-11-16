import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:newsapp/core/base/base_state.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';
import 'package:newsapp/core/theme/text_styles.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/presentation/cubit/searchpage_cubit.dart';
import 'package:newsapp/news_app/presentation/widgets/suggestion_card_widget.dart';
import 'package:newsapp/utils/app_consts.dart';
import 'package:newsapp/utils/enums/quick_search.dart';

import '../../data/models/top_headlines_model.dart';
import '../widgets/tab_view_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  TextEditingController searchedKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageCubit, BaseState>(
        bloc: BlocProvider.of<SearchPageCubit>(context).emitInitialState(),
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InputHistoryTextField(
                        historyListItemLayoutBuilder: (controller, value, index) {
                          return InkWell(
                            onTap: () {
                              controller.select(value.text);
                              BlocProvider.of<SearchPageCubit>(context)
                                  .getNewsByKeywords(searchedKeyword.text);
                              FocusScope.of(context).unfocus();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        value.textToSingleLine,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                      )),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  onPressed: () {
                                    controller.remove(value);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        onSubmitted: (String submittedText) {
                          submittedText = searchedKeyword.text;
                          BlocProvider.of<SearchPageCubit>(context)
                              .getNewsByKeywords(submittedText);
                          FocusScope.of(context).unfocus();
                        },
                        textEditingController: searchedKeyword,
                        style: TextStyle(
                          color: NewsAppColors.accentColor,
                        ),
                        historyKey: "01",
                        listStyle: ListStyle.List,
                        // onChanged:(String val){
                        //   BlocProvider.of<SearchPageCubit>(context)
                        //       .getNewsByKeywords(searchedKeyword.text);
                        // } ,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all( 16.0),
                          prefixIcon: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: NewsAppColors.accentColor,
                              )),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              //to call Cubit method
                              BlocProvider.of<SearchPageCubit>(context)
                                  .getNewsByKeywords(searchedKeyword.text);
                              FocusScope.of(context).unfocus();
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ColoredBox(
                                    color: NewsAppColors.customLightBlue,
                                    child: Icon(
                                      Icons.search,
                                      color: NewsAppColors.accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          hintText: 'Search by keywords like anime',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  BlocBuilder<SearchPageCubit, BaseState>(
                    builder: (context, state) {
                      if (state is StateOnSuccess) {
                        List<Articles> res  = state.response as List<Articles>;
                        if (res.isEmpty ) {
                          return  SizedBox(
                            child: Column(
                              children: [
                                Image.asset('assets/images/file-not-found-illustration-confused-260nw-2153505311.png'),
                                const Text(AppConstants.noResults, style: AppTextStyles.mediumLabelStyle,)
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: TabViewListWidget(
                                newsByCategoryList: state.response,
                              ));
                        }
                      } else if (state is StateInitial) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: quickSearch.values.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SuggestionCardWidget(
                                        suggestionText:
                                            quickSearch.values[index].name,
                                        onTap: () {
                                          BlocProvider.of<SearchPageCubit>(
                                                  context)
                                              .getNewsByKeywords(quickSearch
                                                  .values[index].name);
                                        },
                                      );
                                    }),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.height * 0.3,
                                child:
                                    Image.asset('assets/images/search_pic.png'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
