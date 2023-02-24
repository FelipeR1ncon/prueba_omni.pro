// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoDataDTO _$PhotoDataDTOFromJson(Map<String, dynamic> json) {
  return _PhotoData.fromJson(json);
}

/// @nodoc
mixin _$PhotoDataDTO {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoDataDTOCopyWith<PhotoDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoDataDTOCopyWith<$Res> {
  factory $PhotoDataDTOCopyWith(
          PhotoDataDTO value, $Res Function(PhotoDataDTO) then) =
      _$PhotoDataDTOCopyWithImpl<$Res, PhotoDataDTO>;
  @useResult
  $Res call({String title, String url, String thumbnailUrl});
}

/// @nodoc
class _$PhotoDataDTOCopyWithImpl<$Res, $Val extends PhotoDataDTO>
    implements $PhotoDataDTOCopyWith<$Res> {
  _$PhotoDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoDataCopyWith<$Res>
    implements $PhotoDataDTOCopyWith<$Res> {
  factory _$$_PhotoDataCopyWith(
          _$_PhotoData value, $Res Function(_$_PhotoData) then) =
      __$$_PhotoDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url, String thumbnailUrl});
}

/// @nodoc
class __$$_PhotoDataCopyWithImpl<$Res>
    extends _$PhotoDataDTOCopyWithImpl<$Res, _$_PhotoData>
    implements _$$_PhotoDataCopyWith<$Res> {
  __$$_PhotoDataCopyWithImpl(
      _$_PhotoData _value, $Res Function(_$_PhotoData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$_PhotoData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotoData implements _PhotoData {
  const _$_PhotoData(
      {required this.title, required this.url, required this.thumbnailUrl});

  factory _$_PhotoData.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoDataFromJson(json);

  @override
  final String title;
  @override
  final String url;
  @override
  final String thumbnailUrl;

  @override
  String toString() {
    return 'PhotoDataDTO(title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url, thumbnailUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoDataCopyWith<_$_PhotoData> get copyWith =>
      __$$_PhotoDataCopyWithImpl<_$_PhotoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoDataToJson(
      this,
    );
  }
}

abstract class _PhotoData implements PhotoDataDTO {
  const factory _PhotoData(
      {required final String title,
      required final String url,
      required final String thumbnailUrl}) = _$_PhotoData;

  factory _PhotoData.fromJson(Map<String, dynamic> json) =
      _$_PhotoData.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  String get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoDataCopyWith<_$_PhotoData> get copyWith =>
      throw _privateConstructorUsedError;
}
