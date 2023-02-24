import 'package:freezed_annotation/freezed_annotation.dart';
import '/application/list_photos_failure.dart';
import '/domain/entities/photo.dart';

part 'list_photos_state.freezed.dart';

/// State listPhotos notifier
@freezed
class ListPhotosState with _$ListPhotosState {
  /// Initial state of the list photos
  const factory ListPhotosState.initial() = _Initial;

  /// Loading when it is calling to the service
  const factory ListPhotosState.loading() = _Loading;

  /// Successful State when there is a response
  const factory ListPhotosState.data(List<Photo> photos) = _Data;

  /// Error State when there was an error
  const factory ListPhotosState.error(ListPhotosFailure failure) = _Error;
}
