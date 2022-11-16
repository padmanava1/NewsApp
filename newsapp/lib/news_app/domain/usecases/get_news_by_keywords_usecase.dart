import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failures/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/news_app/domain/repositories/news_app_repository.dart';

class GetNewsByKeywordsUsecase extends Usecase{
  NewsAppRepository newsAppRepository;

  GetNewsByKeywordsUsecase(this.newsAppRepository);

  @override
  Future<Either<Failures, dynamic>> call(params) {
    return newsAppRepository.getNewsByKeywords(params);
  }

}


class GetNewsByKeywordsParams{
  String keyword;

  GetNewsByKeywordsParams(this.keyword);
}