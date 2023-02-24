import 'package:injectable/injectable.dart';
import '/domain/repositories/get_photos_repository.dart';

import 'get_photos_pagination_use_case.dart';

@module
abstract class InjectableUseCaseModule {
  /// Add the use case for the pagination of the photos that it starts
  /// set to 0 and returns 10 photos per page
  ///
  /// if you need another use case with another configuration declare it in
  /// this class with the tag @Named({"instanceName"})]
  @singleton
  GetPhotosPaginationUseCase getDefaultConfigGetPhotosUseCase(
          GetPhotosRepository getPhotosRepository) =>
      GetPhotosPaginationUseCase(getPhotosRepository, 0, 10);
}
