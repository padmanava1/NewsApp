import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/utils/app_consts.dart';

import '../../../core/failures/failures.dart';
import '../models/top_headlines_model.dart';
import 'news_app_data_source.dart';

class NewsAppDataSourceImpl extends NewsAppDataSource {
  final Dio dio;

  NewsAppDataSourceImpl({required this.dio});


  @override
  Future<Either<Failures, List<Articles>>> getTopHeadlines(String country) async{
    try{
      final res = await dio.get('https://newsapi.org/v2/top-headlines',
      queryParameters:{
        "country":country,
        "apiKey":AppConstants.apiKey3
      },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      return Right( model.articles ??[]);
    }
        catch(e){
      print(e);
      return Left(ServerFailure());
        }
  }

  @override
  Future<Either<Failures, List<Articles>>> getNewsByCategory(String? category, String? country) async{
    try{
      category = category;
      final res = await dio.get('https://newsapi.org/v2/top-headlines',
        queryParameters:{
          "category":category,
          "country":country,
          "apiKey":AppConstants.apiKey3
        },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      print(category);
      print(country);
      return Right( model.articles ??[]);
    }
    catch(e){
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, List<Articles>>> getNewsByKeywords(String keyword) async{
    try{
      final res = await dio.get('https://newsapi.org/v2/everything',
        queryParameters:{
          "q":keyword,
          "apiKey":AppConstants.apiKey4
        },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      print(keyword);
      return Right( model.articles ??[]);
    }
    catch(e){
      print(e);
      return Left(ServerFailure());
    }
  }
  }
