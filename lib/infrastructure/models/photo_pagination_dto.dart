import '/infrastructure/models/photo_data_dto.dart';

class PhotoPaginationDTO {
  final List<PhotoDataDTO> items;
  const PhotoPaginationDTO({required this.items});
}
