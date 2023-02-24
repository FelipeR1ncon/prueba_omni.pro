import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain/entities/photo.dart';
import '/application/list_photos_notifier.dart';
import '/application/list_photos_state.dart';
import '/core/injection_container.dart';
import '/domain/use_cases/get_photos_pagination_use_case.dart';

/// Notifier that handles the states to update the photo list ui
final listPhotosNotifier =
    StateNotifierProvider<ListPhotosNotifier, ListPhotosState>(
        (ref) => ListPhotosNotifier(getIt<GetPhotosPaginationUseCase>()));

/// Variable that stores the photos that are obtained from the server in
/// RAM
final listPhotosCached = StateProvider<List<Photo>>((ref) => []);
