import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import 'exceptions/infrastructure_exceptions.dart';
import 'models/photo_data_dto.dart';
import '/infrastructure/client_http.dart';
import 'models/photo_pagination_dto.dart';

abstract class GetPhotosDataSource {
  /// Get a paginated list of photos via the REST protocol
  ///
  /// [start] Lower limit of paging
  /// [limit] Upper limit of paging
  Future<PhotoPaginationDTO> getPhotos(
      {required int start, required int limit});
}

@Injectable(as: GetPhotosDataSource)
class GetPhotosDataSourceImpl implements GetPhotosDataSource {
  final ClientHTTP _clientHTTP;

  GetPhotosDataSourceImpl(this._clientHTTP);

  @override
  Future<PhotoPaginationDTO> getPhotos(
      {required int start, required int limit}) async {
    try {
      var url = Uri.https('jsonplaceholder.typicode.com', 'photos',
          {'_start': '$start', '_limit': '$limit'});


      await Future.delayed(const Duration(seconds: 2));

/*      throw RestApiException(
          errorCode: 231,
          errorMessage: 'Ocurrió un error descargando las fotos..');*/

      var response = await _clientHTTP.get(url);

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return const PhotoPaginationDTO(items: []);
        }
        final decodedList = jsonDecode(response.body) as List;
        return PhotoPaginationDTO(
            items: decodedList
                .map((e) => PhotoDataDTO.fromJson(e as Map<String, dynamic>))
                .toList());
      } else {
        throw RestApiException(
            errorCode: response.statusCode,
            errorMessage: 'Ocurrió un error descargando las fotos..');
      }
    } on SocketException catch (_) {
      throw const NoInternetConnectionException('No hay conexión a internet.');
    } catch (_) {
      rethrow;
    }
  }
}
