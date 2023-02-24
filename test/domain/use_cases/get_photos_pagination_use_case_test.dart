import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pagination/domain/entities/photo.dart';
import 'package:pagination/domain/repositories/get_photos_repository.dart';
import 'package:pagination/domain/use_cases/get_photos_pagination_use_case.dart';
import 'package:pagination/infrastructure/exceptions/infrastructure_exceptions.dart';

import 'get_photos_pagination_use_case_test.mocks.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<GetPhotosRepository>()])
void main() {
  late GetPhotosRepository repository;

  setUp(() {
    repository = MockGetPhotosRepository();
  });

  test('Obtener lista de fotos paginada', () async {
    // Arrange
    when(repository.getPhotos(start: 0, limit: 5))
        .thenAnswer((_) async => List.generate(
              5,
              (index) => Photo('title', 'url', 'thumbnailUrl'),
            ));

    final useCase = GetPhotosPaginationUseCase(repository, 0, 5);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result.length, equals(5));
  });

  test('Actualizar la paginación', () async{
    // Arrange
    when(repository.getPhotos(start: 0, limit: 5))
        .thenAnswer((_) async => List.generate(
              5,
              (index) => Photo('title', 'url', 'thumbnailUrl'),
            ));

    //Act
    final useCase = GetPhotosPaginationUseCase(repository, 0, 5);
    final result = await useCase.execute();

    // Assert
    expect(result.length, equals(5));
    expect(useCase.currentInitialPagination, equals(5));
  });

  test('Lanzar una excepción si la obtención de fotos falla', () async {
    // Arrange
    final repository = MockGetPhotosRepository();
    when(repository.getPhotos(
            start: anyNamed('start'), limit: anyNamed('limit')))
        .thenThrow(const NoInternetConnectionException('Error'));

    final useCase = GetPhotosPaginationUseCase(repository, 0, 5);

    // Act + Assert
    expect(useCase.execute(), throwsException);
  });
}
