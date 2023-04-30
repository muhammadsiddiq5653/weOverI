import '../../../export.dart';

mixin HomeRepo {
  Future<Either<AppError, dynamic>> getCurrentWeather(String userLocation);
}
