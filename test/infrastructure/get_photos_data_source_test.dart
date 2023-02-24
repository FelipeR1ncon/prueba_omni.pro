import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pagination/infrastructure/client_http.dart';
import 'package:pagination/infrastructure/exceptions/infrastructure_exceptions.dart';
import 'package:pagination/infrastructure/get_photos_data_source.dart';
import 'package:pagination/infrastructure/models/photo_data_dto.dart';
import 'package:pagination/infrastructure/models/photo_pagination_dto.dart';

import 'get_photos_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ClientHTTP>()])
void main() {
  late GetPhotosDataSource dataSource;
  late ClientHTTP mockClient;

  setUp(() {
    mockClient = MockClientHTTP();
    dataSource = GetPhotosDataSourceImpl(mockClient);
  });

  group('getPhotos', () {
    const start = 0;
    const limit = 20;
    final url = Uri.https('jsonplaceholder.typicode.com', 'photos',
        {'_start': '$start', '_limit': '$limit'});

    test('returns PhotoPaginationDTO when the call completes successfully',
        () async {
      const expected = PhotoPaginationDTO(items: [
        PhotoDataDTO(
            title: 'accusamus beatae ad facilis cum similique qui sunt',
            url: 'https://via.placeholder.com/600/92c952',
            thumbnailUrl: 'https://via.placeholder.com/150/92c952'),
        PhotoDataDTO(
            title: 'reprehenderit est deserunt velit ipsam',
            url: 'https://via.placeholder.com/600/771796',
            thumbnailUrl: 'https://via.placeholder.com/150/771796')
      ]);

      final response = http.Response(
        jsonEncode([
          {
            'id': 1,
            'title': 'accusamus beatae ad facilis cum similique qui sunt',
            'url': 'https://via.placeholder.com/600/92c952',
            'thumbnailUrl': 'https://via.placeholder.com/150/92c952'
          },
          {
            'id': 2,
            'title': 'reprehenderit est deserunt velit ipsam',
            'url': 'https://via.placeholder.com/600/771796',
            'thumbnailUrl': 'https://via.placeholder.com/150/771796'
          }
        ]),
        200,
      );

      when(mockClient.get(url)).thenAnswer((_) async => response);

      final result = await dataSource.getPhotos(start: start, limit: limit);

      expect(result.items[0], expected.items[0]);
      expect(result.items[1], expected.items[1]);
      verify(mockClient.get(url)).called(1);
    });

    test('returns NoInternetConnectionException when there is no internet',
        () async {
      when(mockClient.get(url)).thenThrow(const SocketException(''));

      expect(dataSource.getPhotos(start: start, limit: limit),
          throwsA(const TypeMatcher<NoInternetConnectionException>()));

    });

    test('throws RestApiException when status code is not 200', () async {
      when(mockClient.get(url))
          .thenAnswer((_) async => http.Response(jsonEncode([]), 502));

      expect(dataSource.getPhotos(start: start, limit: limit),
          throwsA(const TypeMatcher<RestApiException>()));

    });
  });
}
