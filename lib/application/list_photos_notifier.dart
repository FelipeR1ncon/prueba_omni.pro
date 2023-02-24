import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/application/list_photos_failure.dart';
import '/domain/use_cases/get_photos_pagination_use_case.dart';
import '/infrastructure/exceptions/infrastructure_exceptions.dart';

import 'list_photos_state.dart';

/// Notifier in charge of calling the use case to get the photos
/// and update the states to paint the ui
class ListPhotosNotifier extends StateNotifier<ListPhotosState> {
  ListPhotosNotifier(this._getPhotos) : super(const ListPhotosState.initial());

  final GetPhotosPaginationUseCase _getPhotos;

  /// Get the photos via [_getPhotos] use case
  /// update the state based on the result.
  Future<void> getPhotos({bool nextPage = true}) async {
    try {
      state = const ListPhotosState.loading();

      final pagePhotos = await _getPhotos.execute(updatePage: nextPage);

      state = ListPhotosState.data(pagePhotos);
    } on NoInternetConnectionException catch (e) {
      state = ListPhotosState.error(
          ListPhotosFailure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      state = ListPhotosState.error(ListPhotosFailure.server(
          message: e.errorMessage ??
              'Ocurrió un error descargando las fotos, por favor intente de nuevo.',
          code: e.errorCode ?? 0));
    } catch (_) {
      rethrow;
    }
  }
}
