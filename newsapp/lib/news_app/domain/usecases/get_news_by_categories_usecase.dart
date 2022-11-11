import 'package:dartz/dartz.dart';
import 'package:newsapp/core/failures/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/news_app/domain/repositories/news_app_repository.dart';

class GetNewsByCategoriesUsecase extends Usecase{
  NewsAppRepository newsAppRepository;

  GetNewsByCategoriesUsecase(this.newsAppRepository);

  @override
  Future<Either<Failures, dynamic>> call(params) {
  return newsAppRepository.getNewsByCategory(params);
  }
  
}

class GetNewsByCategoriesParam{
  String? categories;
  String? country;

  GetNewsByCategoriesParam(this.categories, this.country);
}