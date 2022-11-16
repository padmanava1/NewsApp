import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/base/base_state.dart';

import '../../domain/usecases/get_news_by_keywords_usecase.dart';

class SearchPageCubit extends Cubit<BaseState>{
  GetNewsByKeywordsUsecase getNewsByKeywordsUsecase;
  SearchPageCubit({required this.getNewsByKeywordsUsecase}) : super(StateInitial());

  emitInitialState(){
    emit(StateInitial());
  }

  getNewsByKeywords(String keyword) async{
    var response = await getNewsByKeywordsUsecase.call(GetNewsByKeywordsParams(keyword));
    response.fold((l) {
      emit(StateNoData(msg: "Error occured in cubit!"));
    }, (r) {
      emit(StateOnSuccess(response: r));
    });
  }
}