// Mocks generated by Mockito 5.3.2 from annotations
// in pagination/test/infrastructure/get_photos_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pagination/infrastructure/get_photos_data_source.dart' as _i3;
import 'package:pagination/infrastructure/models/photo_pagination_dto.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePhotoPaginationDTO_0 extends _i1.SmartFake
    implements _i2.PhotoPaginationDTO {
  _FakePhotoPaginationDTO_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPhotosDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPhotosDataSource extends _i1.Mock
    implements _i3.GetPhotosDataSource {
  @override
  _i4.Future<_i2.PhotoPaginationDTO> getPhotos({
    required int? start,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPhotos,
          [],
          {
            #start: start,
            #limit: limit,
          },
        ),
        returnValue:
            _i4.Future<_i2.PhotoPaginationDTO>.value(_FakePhotoPaginationDTO_0(
          this,
          Invocation.method(
            #getPhotos,
            [],
            {
              #start: start,
              #limit: limit,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.PhotoPaginationDTO>.value(_FakePhotoPaginationDTO_0(
          this,
          Invocation.method(
            #getPhotos,
            [],
            {
              #start: start,
              #limit: limit,
            },
          ),
        )),
      ) as _i4.Future<_i2.PhotoPaginationDTO>);
}
