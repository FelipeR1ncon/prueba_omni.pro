import '/domain/entities/photo.dart';
import 'models/photo_data_dto.dart';
import 'models/photo_pagination_dto.dart';

/// Convert a PhotoPaginationDTO in List<Photo>
extension MapperPagePhotoDTO on PhotoPaginationDTO {
  List<Photo> toDomain() => List.of(items.map((e) => e.toDomain()).toList());
}

/// Convert PhotoDataDTO in Photo
extension MapperPhotoDataDTO on PhotoDataDTO {
  Photo toDomain() => Photo(title, url, thumbnailUrl);
}
