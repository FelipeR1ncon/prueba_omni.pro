import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pagination/application/list_photos_failure.dart';
import 'package:pagination/application/list_photos_notifier.dart';
import 'package:pagination/application/list_photos_state.dart';
import 'package:pagination/domain/entities/photo.dart';
import 'package:pagination/domain/use_cases/get_photos_pagination_use_case.dart';
import 'package:pagination/infrastructure/exceptions/infrastructure_exceptions.dart';

import 'list_photos_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetPhotosPaginationUseCase>()])
void main() {
  late GetPhotosPaginationUseCase getPhotos;
  late ListPhotosNotifier notifier;

  const mockPagePhotos = [
    Photo(
      'Photo 1',
      'https://www.example.com/photos/1',
      'https://www.example.com/photos/1/thumbnail',
    ),
    Photo(
      'Photo 2',
      'https://www.example.com/photos/2',
      'https://www.example.com/photos/2/thumbnail',
    )
  ];

  setUp(() {
    getPhotos = MockGetPhotosPaginationUseCase();
    notifier = ListPhotosNotifier(getPhotos);
  });

  group('GetPhoto notifier', () {
    test(
        'should emit state '
        'Initial, Loading, Data', () async {
      //arrange
      when(
        getPhotos.execute(),
      ).thenAnswer((_) async => (mockPagePhotos));

      const tListPhotosStates = [
        ListPhotosState.initial(),
        ListPhotosState.loading(),
        ListPhotosState.data(mockPagePhotos)
      ];

      final listPhotosStates = <ListPhotosState>[];

      notifier.addListener(listPhotosStates.add);
      //act
      await notifier.getPhotos();
      //assert
      expect(listPhotosStates, tListPhotosStates);
    });

    test(
        'should emit  state '
        'Initial, Loading, Error ListPhotosFailure.noConnection', () async {
      String messageError = 'error';
      //arrange
      when(
        getPhotos.execute(),
      ).thenThrow(NoInternetConnectionException(messageError));

      final tListPhotosStates = [
        const ListPhotosState.initial(),
        const ListPhotosState.loading(),
        ListPhotosState.error(
            ListPhotosFailure.noConnection(message: messageError))
      ];

      final listPhotosStates = <ListPhotosState>[];
      notifier.addListener(listPhotosStates.add);

      //act
      await notifier.getPhotos();
      //assert
      expect(listPhotosStates, tListPhotosStates);
    });

    test(
        'should emit  state '
        'Initial, Loading, Error with ListPhotosFailure.server ', () async {
      String messageError = 'error';
      //arrange
      when(
        getPhotos.execute(),
      ).thenThrow(RestApiException(errorMessage: messageError, errorCode: 1));

      final tListPhotosStates = [
        const ListPhotosState.initial(),
        const ListPhotosState.loading(),
        ListPhotosState.error(
            ListPhotosFailure.server(message: messageError, code: 1))
      ];

      final listPhotosStates = <ListPhotosState>[];
      notifier.addListener(listPhotosStates.add);

      //act
      await notifier.getPhotos();
      //assert
      expect(listPhotosStates, tListPhotosStates);
    });
  });
}
