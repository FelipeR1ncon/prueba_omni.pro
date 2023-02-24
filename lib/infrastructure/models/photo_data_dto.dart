import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_data_dto.freezed.dart';

part 'photo_data_dto.g.dart';

@freezed
class PhotoDataDTO with _$PhotoDataDTO {
  const factory PhotoDataDTO(
      {required String title,
      required String url,
      required String thumbnailUrl}) = _PhotoData;

  factory PhotoDataDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDataDTOFromJson(json);
}
