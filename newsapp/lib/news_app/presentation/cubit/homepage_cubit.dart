import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/base/base_state.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/domain/usecases/get_news_by_categories_usecase.dart';
import 'package:newsapp/news_app/domain/usecases/get_top_headlines_usecase.dart';
import 'package:newsapp/utils/enums/categories.dart';
import 'package:url_launcher/url_launcher.dart';


class HomepageCubit extends Cubit<BaseState> {
  HomepageCubit({required this.getTopHeadlinesUsecase, required this.getNewsByCategoriesUsecase}) : super(StateInitial());

  GetTopHeadlinesUsecase getTopHeadlinesUsecase;
  GetNewsByCategoriesUsecase getNewsByCategoriesUsecase;

  String defaultCategory = 'business';
  String defaultCountryCode = 'in';
  //bool isCountrySelected = false;
  String countryName = 'Select Country';

  var homepageStateData = HomepageState();
  List<List<Articles>> allCategoriesList = [[],[],[],[],[],[],[]];

  getTopHeadlines({String? country}) async{
    country = defaultCountryCode;

  final response = await getTopHeadlinesUsecase.call(GetTopHeadlinesParams(country));
  response.fold(
          (l) {
            emit(StateNoData(msg: "Sorry some error occurred in Cubit level"));
          }, (r) {
    homepageStateData  = HomepageState(headlinesList:  r);
            emit(StateOnSuccess(response: HomepageState(headlinesList: r)));
            getNewsBycategories();
  });
  }

  getNewsBycategories({int index = 0}) async{

    defaultCategory = categories.values[index].name;

    print("::::::::::::in Cubit ::$state");
    emit(StateOnSuccess(response: homepageStateData));

    final success = state as StateOnSuccess<HomepageState>;

      final response = await getNewsByCategoriesUsecase.call(GetNewsByCategoriesParam(defaultCategory, defaultCountryCode));
      response.fold((l) {
        emit(StateNoData());
      }, (r) {
        print('r in success of copyWith${r}');
        if(allCategoriesList[index].isEmpty){
          allCategoriesList[index] = r;
          emit(success.copyWith(
              response: success.response?.copyWith(
                  newsByCategoriesList: allCategoriesList[index]
              )
          ));
          print( 'api called!');
        }
        else{
          emit(success.copyWith(
              response: success.response?.copyWith(
                  newsByCategoriesList: allCategoriesList[index]
              )
          ));
        }

      });
  }

  // void updateUi() {
  //   if (state is StateOnSuccess<HomepageState>) {
  //     final success = state as StateOnSuccess<HomepageState>;
  //     emit(success.copyWith(flag: isUpdated ));
  //   } else {
  //     emit(StateOnSuccess(flag: false));
  //   }
  // }

  // callCategoriesByTab(int index){
  //     defaultCategory = categories.values[index].name;
  //     print('state after method called :::: $state');
  //     emit(StateOnSuccess(response: homepageStateData));
  //     getNewsBycategories();
  // }



  void launchURL(String? url) async{
    var newsUrl = url;
    if(await canLaunch(newsUrl!)){
      await launch(newsUrl);
    }
    else{
      throw 'Could not launch $newsUrl';
    }
  }
}


class HomepageState {
  List<Articles>? headlinesList;
  List<Articles>? newsByCategoriesList;

  HomepageState({this.headlinesList, this.newsByCategoriesList});

  HomepageState copyWith({
    List<Articles>? headlinesList,
    List<Articles>? newsByCategoriesList,
}) {
    return HomepageState(
        headlinesList: headlinesList ?? this.headlinesList,
        newsByCategoriesList: newsByCategoriesList?? this.newsByCategoriesList
    );
  }

}

