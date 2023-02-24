import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_photos_failure.freezed.dart';

/// Different kind of failures that will be handled
@freezed
class ListPhotosFailure with _$ListPhotosFailure {
  const ListPhotosFailure._();

  /// When something went wrong in the server side
  const factory ListPhotosFailure.server({
    required String message,
    required int code,
  }) = _Server;

  /// When there is not internet connection
  const factory ListPhotosFailure.noConnection({required String message}) =
      _NoConnection;
}
