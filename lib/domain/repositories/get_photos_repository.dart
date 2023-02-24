import '/domain/entities/photo.dart';

abstract class GetPhotosRepository {
  /// Get a list of photos by performing a
  /// request to an external service that supports paging
  /// [start] initial index paging
  /// [limit] Upper limit items of paging
  Future<List<Photo>> getPhotos({required int start, required int limit});
}
