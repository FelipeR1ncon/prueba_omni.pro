import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pagination/domain/repositories/get_photos_repository.dart';
import 'package:pagination/infrastructure/get_photos_data_source.dart';
import 'package:pagination/infrastructure/get_photos_repository_imp.dart';
import 'package:pagination/infrastructure/mapper_to_domain.dart';
import 'package:pagination/infrastructure/models/photo_data_dto.dart';
import 'package:pagination/infrastructure/models/photo_pagination_dto.dart';

import 'get_photos_repository_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetPhotosDataSource>()])
void main() {
  late GetPhotosRepository repository;
  late GetPhotosDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockGetPhotosDataSource();
    repository = GetPhotosRepositoryImp(mockDataSource);
  });

  group('GetPhotosRepository', () {
    const tStartPagination = 0;
    const tLimit = 20;
    const tPhotoPaginationDTO = PhotoPaginationDTO(
      items: [
        PhotoDataDTO(
          title: 'Photo 1',
          url: 'https://www.example.com/photos/1',
          thumbnailUrl: 'https://www.example.com/photos/1/thumbnail',
        ),
        PhotoDataDTO(
          title: 'Photo 2',
          url: 'https://www.example.com/photos/2',
          thumbnailUrl: 'https://www.example.com/photos/2/thumbnail',
        ),
      ],
    );

    final tPhotos = MapperPagePhotoDTO(tPhotoPaginationDTO).toDomain();

    test(
      'should return a list of photos from the data source',
      () async {
        // arrange
        when(mockDataSource.getPhotos(start: tStartPagination, limit: tLimit))
            .thenAnswer((_) async => tPhotoPaginationDTO);
        // act
        final result =
            await repository.getPhotos(start: tStartPagination, limit: tLimit);
        // assert
        expect(result[0], tPhotos[0]);
        expect(result[1], tPhotos[1]);
      },
    );

    test(
      'should throw an exception when there is an error getting photos from the data source',
      () async {
        // arrange
        when(mockDataSource.getPhotos(start: tStartPagination, limit: tLimit))
            .thenThrow(Exception('Failed to get photos'));
        // act
        // assert
        expect(repository.getPhotos(start: tStartPagination, limit: tLimit),
            throwsException);
      },
    );
  });
}
