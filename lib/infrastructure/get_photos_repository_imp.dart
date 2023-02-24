import 'package:injectable/injectable.dart';
import '/domain/entities/photo.dart';
import '/domain/repositories/get_photos_repository.dart';
import '/infrastructure/get_photos_data_source.dart';
import '/infrastructure/mapper_to_domain.dart';
import 'models/photo_pagination_dto.dart';

/// Implementation [GetPhotosRepository]
@Injectable(as: GetPhotosRepository)
class GetPhotosRepositoryImp extends GetPhotosRepository {
  final GetPhotosDataSource _getPhotosDataSource;

  GetPhotosRepositoryImp(this._getPhotosDataSource);

  @override
  Future<List<Photo>> getPhotos(
      {required int start, required int limit}) async {
    PhotoPaginationDTO pagePhotosDTO =
        await _getPhotosDataSource.getPhotos(start: start, limit: limit);

    return MapperPagePhotoDTO(pagePhotosDTO).toDomain();
  }
}
