import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';
import 'package:newsapp/utils/app_consts.dart';

import '../../../core/failures/failures.dart';
import '../models/top_headlines_model.dart';
import 'news_app_data_source.dart';

class NewsAppDataSourceImpl extends NewsAppDataSource {
  final Dio dio;
  List<String> apiKeys = [AppConstants.apiKey,AppConstants.apiKey2,AppConstants.apiKey3,AppConstants.apiKey4,AppConstants.apiKey5,AppConstants.apiKey6,AppConstants.apiKey7];
  int keyIndex = 0;

  NewsAppDataSourceImpl({required this.dio});


  @override
  Future<Either<Failures, List<Articles>>> getTopHeadlines(String country) async{
    try{
      final res = await dio.get('https://newsapi.org/v2/top-headlines',
      queryParameters:{
        "country":country,
        "apiKey":apiKeys[keyIndex]
      },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      return Right( model.articles ??[]);
    }
    catch (e) {
      if (keyIndex < 6) {
        keyIndex = keyIndex + 1;
      } else if (keyIndex == 6) {
        keyIndex = keyIndex - 6;
      }

      try {
        // Call the API again by recursively invoking the function
        return await getTopHeadlines(country);
      } catch (_) {
        // If an error occurs during the recursive call, return ServerFailure
        return Left(ServerFailure());
      }
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
          "apiKey":apiKeys[keyIndex]
        },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      print(category);
      print(country);
      return Right( model.articles ??[]);
    }
    catch(e){
      if(keyIndex<5) {
        keyIndex = keyIndex + 1;
      }
      else if(keyIndex == 5){
        keyIndex = keyIndex-5;
      }
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
          "apiKey":apiKeys[keyIndex]
        },
      );
      var jsonData = res.data ;
      final model=TopHeadlinesModel.fromJson(jsonData);
      print(keyword);
      return Right( model.articles ??[]);
    }
    catch(e){
      if(keyIndex<5) {
        keyIndex = keyIndex + 1;
      }
      else if(keyIndex == 5){
        keyIndex = keyIndex-5;
      }
      print(e);
      return Left(ServerFailure());
    }
  }
  }
