import 'package:dartz/dartz.dart';
import 'package:newsapp/news_app/data/models/articles_model.dart';

import '../../../core/failures/failures.dart';
import '../models/top_headlines_model.dart';

  abstract class NewsAppDataSource {
  Future<Either<Failures, List<Articles>>> getTopHeadlines(String country);
  Future<Either<Failures, List<Articles>>> getNewsByCategory(String? category, String? country);
}