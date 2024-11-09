// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<R, E> {
  Object? get response => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R response) success,
    required TResult Function(E response) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(R response)? success,
    TResult? Function(E response)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R response)? success,
    TResult Function(E response)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponseSuccess<R, E> value) success,
    required TResult Function(_ApiResponseError<R, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResponseSuccess<R, E> value)? success,
    TResult? Function(_ApiResponseError<R, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponseSuccess<R, E> value)? success,
    TResult Function(_ApiResponseError<R, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<R, E, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<R, E> value, $Res Function(ApiResponse<R, E>) then) =
      _$ApiResponseCopyWithImpl<R, E, $Res, ApiResponse<R, E>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<R, E, $Res, $Val extends ApiResponse<R, E>>
    implements $ApiResponseCopyWith<R, E, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiResponseSuccessImplCopyWith<R, E, $Res> {
  factory _$$ApiResponseSuccessImplCopyWith(
          _$ApiResponseSuccessImpl<R, E> value,
          $Res Function(_$ApiResponseSuccessImpl<R, E>) then) =
      __$$ApiResponseSuccessImplCopyWithImpl<R, E, $Res>;
  @useResult
  $Res call({R response});
}

/// @nodoc
class __$$ApiResponseSuccessImplCopyWithImpl<R, E, $Res>
    extends _$ApiResponseCopyWithImpl<R, E, $Res,
        _$ApiResponseSuccessImpl<R, E>>
    implements _$$ApiResponseSuccessImplCopyWith<R, E, $Res> {
  __$$ApiResponseSuccessImplCopyWithImpl(_$ApiResponseSuccessImpl<R, E> _value,
      $Res Function(_$ApiResponseSuccessImpl<R, E>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$ApiResponseSuccessImpl<R, E>(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$ApiResponseSuccessImpl<R, E> implements _ApiResponseSuccess<R, E> {
  _$ApiResponseSuccessImpl(this.response);

  @override
  final R response;

  @override
  String toString() {
    return 'ApiResponse<$R, $E>.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseSuccessImpl<R, E> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseSuccessImplCopyWith<R, E, _$ApiResponseSuccessImpl<R, E>>
      get copyWith => __$$ApiResponseSuccessImplCopyWithImpl<R, E,
          _$ApiResponseSuccessImpl<R, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R response) success,
    required TResult Function(E response) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(R response)? success,
    TResult? Function(E response)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R response)? success,
    TResult Function(E response)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponseSuccess<R, E> value) success,
    required TResult Function(_ApiResponseError<R, E> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResponseSuccess<R, E> value)? success,
    TResult? Function(_ApiResponseError<R, E> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponseSuccess<R, E> value)? success,
    TResult Function(_ApiResponseError<R, E> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ApiResponseSuccess<R, E> implements ApiResponse<R, E> {
  factory _ApiResponseSuccess(final R response) =
      _$ApiResponseSuccessImpl<R, E>;

  @override
  R get response;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseSuccessImplCopyWith<R, E, _$ApiResponseSuccessImpl<R, E>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResponseErrorImplCopyWith<R, E, $Res> {
  factory _$$ApiResponseErrorImplCopyWith(_$ApiResponseErrorImpl<R, E> value,
          $Res Function(_$ApiResponseErrorImpl<R, E>) then) =
      __$$ApiResponseErrorImplCopyWithImpl<R, E, $Res>;
  @useResult
  $Res call({E response});
}

/// @nodoc
class __$$ApiResponseErrorImplCopyWithImpl<R, E, $Res>
    extends _$ApiResponseCopyWithImpl<R, E, $Res, _$ApiResponseErrorImpl<R, E>>
    implements _$$ApiResponseErrorImplCopyWith<R, E, $Res> {
  __$$ApiResponseErrorImplCopyWithImpl(_$ApiResponseErrorImpl<R, E> _value,
      $Res Function(_$ApiResponseErrorImpl<R, E>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$ApiResponseErrorImpl<R, E>(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$ApiResponseErrorImpl<R, E> implements _ApiResponseError<R, E> {
  _$ApiResponseErrorImpl(this.response);

  @override
  final E response;

  @override
  String toString() {
    return 'ApiResponse<$R, $E>.error(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseErrorImpl<R, E> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseErrorImplCopyWith<R, E, _$ApiResponseErrorImpl<R, E>>
      get copyWith => __$$ApiResponseErrorImplCopyWithImpl<R, E,
          _$ApiResponseErrorImpl<R, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R response) success,
    required TResult Function(E response) error,
  }) {
    return error(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(R response)? success,
    TResult? Function(E response)? error,
  }) {
    return error?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R response)? success,
    TResult Function(E response)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResponseSuccess<R, E> value) success,
    required TResult Function(_ApiResponseError<R, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResponseSuccess<R, E> value)? success,
    TResult? Function(_ApiResponseError<R, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResponseSuccess<R, E> value)? success,
    TResult Function(_ApiResponseError<R, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ApiResponseError<R, E> implements ApiResponse<R, E> {
  factory _ApiResponseError(final E response) = _$ApiResponseErrorImpl<R, E>;

  @override
  E get response;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseErrorImplCopyWith<R, E, _$ApiResponseErrorImpl<R, E>>
      get copyWith => throw _privateConstructorUsedError;
}
