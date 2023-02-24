import '/domain/entities/photo.dart';
import '/domain/repositories/get_photos_repository.dart';

/// Singleton use case to get a list of photos with pagination
/// You can configure the pagination through two parameters.
///
/// [startPagination] indicates the starting position of the paging list.
///
/// [limit] the number of photos to bring up on each page.
class GetPhotosPaginationUseCase {
  final GetPhotosRepository _getPhotosRepository;

  /// Indicates the initial position of the pagination list.
  int _startPagination;

  /// The number of photos that will be brought to each page.
  final int _limit;

  GetPhotosPaginationUseCase(
      this._getPhotosRepository, this._startPagination, this._limit);

  /// Return a list of photos via the [_getPhotosRepository]
  /// with pagination according to the current values of [_startPagination]
  /// and [_limit]
  ///
  /// Update the values to load the next page if [updatePage]
  /// is true (default value).
  ///
  /// If you need to request the same page in the next call by a
  /// echo in particular send [updatePage] to false.
  Future<List<Photo>> execute({bool updatePage = true}) async {
    /// The try catch ensures that the page is only updated if the data
    /// get successfully
    try {
      List<Photo> currentPagePhotos = await _getPhotosRepository.getPhotos(
          start: _startPagination, limit: _limit);
      if (updatePage) _nextPage();
      return currentPagePhotos;
    } catch (e) {
      rethrow;
    }
  }

  /// Update the values of
  /// [_currentInitialIndex] and [_currentTopLimit]
  /// according to the pagination configuration.
  void _nextPage() {
    _startPagination += _limit;
  }

  int get currentInitialPagination => _startPagination;
}
