// Mocks generated by Mockito 5.3.2 from annotations
// in pagination/test/application/list_photos_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pagination/domain/entities/photo.dart' as _i4;
import 'package:pagination/domain/use_cases/get_photos_pagination_use_case.dart'
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

/// A class which mocks [GetPhotosPaginationUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPhotosPaginationUseCase extends _i1.Mock
    implements _i2.GetPhotosPaginationUseCase {
  @override
  int get currentInitialPagination => (super.noSuchMethod(
        Invocation.getter(#currentInitialPagination),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i3.Future<List<_i4.Photo>> execute({bool? updatePage = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#updatePage: updatePage},
        ),
        returnValue: _i3.Future<List<_i4.Photo>>.value(<_i4.Photo>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.Photo>>.value(<_i4.Photo>[]),
      ) as _i3.Future<List<_i4.Photo>>);
}
