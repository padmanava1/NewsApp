import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failures/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/data/models/top_headlines_model.dart';
import 'package:newsapp/news_app/domain/repositories/news_app_repository.dart';

class GetTopHeadlinesUsecase extends Usecase{
  NewsAppRepository newsAppRepository;

  GetTopHeadlinesUsecase(this.newsAppRepository);

  @override
  Future<Either<Failures, dynamic>> call(params) {
  return newsAppRepository.getTopHeadlines(params);
  }


}

class GetTopHeadlinesParams{
final String? country;

GetTopHeadlinesParams(this.country);
}