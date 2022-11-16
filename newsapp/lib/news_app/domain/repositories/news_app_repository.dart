import 'package:dartz/dartz.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/data/models/top_headlines_model.dart';
import 'package:newsapp/news_app/domain/usecases/get_news_by_categories_usecase.dart';
import 'package:newsapp/news_app/domain/usecases/get_top_headlines_usecase.dart';

import '../../../core/failures/failures.dart';
import '../usecases/get_news_by_keywords_usecase.dart';

abstract class NewsAppRepository{
  Future<Either<Failures, List<Articles>>> getTopHeadlines(GetTopHeadlinesParams params);
  Future<Either<Failures, List<Articles>>> getNewsByCategory(GetNewsByCategoriesParam params);
  Future<Either<Failures, List<Articles>>> getNewsByKeywords(GetNewsByKeywordsParams params);

}