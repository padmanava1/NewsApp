import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/news_app/data/data_sources/news_app_data_source.dart';
import 'package:newsapp/news_app/data/repositories/news_app_repository_impl.dart';
import 'package:newsapp/news_app/domain/repositories/news_app_repository.dart';
import 'package:newsapp/news_app/domain/usecases/get_news_by_categories_usecase.dart';
import 'package:newsapp/news_app/domain/usecases/get_news_by_keywords_usecase.dart';
import 'package:newsapp/news_app/domain/usecases/get_top_headlines_usecase.dart';
import 'package:newsapp/news_app/presentation/cubit/homepage_cubit.dart';
import 'package:newsapp/news_app/presentation/cubit/searchpage_cubit.dart';

import 'news_app/data/data_sources/news_app_data_source_impl.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => HomepageCubit(
      getTopHeadlinesUsecase: sl(), getNewsByCategoriesUsecase: sl()));

  sl.registerLazySingleton(() => SearchPageCubit(getNewsByKeywordsUsecase: sl()));

  sl.registerLazySingleton(() => GetTopHeadlinesUsecase(sl()));
  sl.registerLazySingleton(() => GetNewsByCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetNewsByKeywordsUsecase(sl()));

  sl.registerLazySingleton<NewsAppRepository>(
      () => NewsAppRepositoryImpl(newsAppDataSource: sl()));

  sl.registerLazySingleton<NewsAppDataSource>(
      () => NewsAppDataSourceImpl(dio: sl()));

  sl.registerLazySingleton(() => Dio());
}
