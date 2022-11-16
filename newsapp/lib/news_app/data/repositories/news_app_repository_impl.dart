import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failures/failures.dart';
import 'package:newsapp/news_app/data/data_sources/news_app_data_source.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/news_app/data/models/top_headlines_model.dart';
import 'package:newsapp/news_app/domain/repositories/news_app_repository.dart';
import 'package:newsapp/news_app/domain/usecases/get_news_by_categories_usecase.dart';
import 'package:newsapp/news_app/domain/usecases/get_top_headlines_usecase.dart';

import '../../domain/usecases/get_news_by_keywords_usecase.dart';

class NewsAppRepositoryImpl extends NewsAppRepository{
  NewsAppDataSource newsAppDataSource;

  NewsAppRepositoryImpl({required this.newsAppDataSource});

  @override
  Future<Either<Failures, List<Articles>>> getTopHeadlines(GetTopHeadlinesParams params) async {
   return await newsAppDataSource.getTopHeadlines(params.country!);
  }

  @override
  Future<Either<Failures, List<Articles>>> getNewsByCategory(GetNewsByCategoriesParam params) async{
   return await newsAppDataSource.getNewsByCategory(params.categories, params.country!);
  }

  @override
  Future<Either<Failures, List<Articles>>> getNewsByKeywords(GetNewsByKeywordsParams params) async{
    return await newsAppDataSource.getNewsByKeywords(params.keyword);
  }





  }

