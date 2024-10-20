// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_joke_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchJokeResult _$SearchJokeResultFromJson(Map<String, dynamic> json) {
  return _SearchJokeResult.fromJson(json);
}

/// @nodoc
mixin _$SearchJokeResult {
  int get current_page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get next_page => throw _privateConstructorUsedError;
  int get previous_page => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<Joke> get jokes => throw _privateConstructorUsedError;
  String get search_term => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  int get total_jokes => throw _privateConstructorUsedError;
  int get total_pages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchJokeResultCopyWith<SearchJokeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchJokeResultCopyWith<$Res> {
  factory $SearchJokeResultCopyWith(
          SearchJokeResult value, $Res Function(SearchJokeResult) then) =
      _$SearchJokeResultCopyWithImpl<$Res, SearchJokeResult>;
  @useResult
  $Res call(
      {int current_page,
      int limit,
      int next_page,
      int previous_page,
      @JsonKey(name: 'results') List<Joke> jokes,
      String search_term,
      int status,
      int total_jokes,
      int total_pages});
}

/// @nodoc
class _$SearchJokeResultCopyWithImpl<$Res, $Val extends SearchJokeResult>
    implements $SearchJokeResultCopyWith<$Res> {
  _$SearchJokeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? limit = null,
    Object? next_page = null,
    Object? previous_page = null,
    Object? jokes = null,
    Object? search_term = null,
    Object? status = null,
    Object? total_jokes = null,
    Object? total_pages = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      next_page: null == next_page
          ? _value.next_page
          : next_page // ignore: cast_nullable_to_non_nullable
              as int,
      previous_page: null == previous_page
          ? _value.previous_page
          : previous_page // ignore: cast_nullable_to_non_nullable
              as int,
      jokes: null == jokes
          ? _value.jokes
          : jokes // ignore: cast_nullable_to_non_nullable
              as List<Joke>,
      search_term: null == search_term
          ? _value.search_term
          : search_term // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      total_jokes: null == total_jokes
          ? _value.total_jokes
          : total_jokes // ignore: cast_nullable_to_non_nullable
              as int,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchJokeResultCopyWith<$Res>
    implements $SearchJokeResultCopyWith<$Res> {
  factory _$$_SearchJokeResultCopyWith(
          _$_SearchJokeResult value, $Res Function(_$_SearchJokeResult) then) =
      __$$_SearchJokeResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current_page,
      int limit,
      int next_page,
      int previous_page,
      @JsonKey(name: 'results') List<Joke> jokes,
      String search_term,
      int status,
      int total_jokes,
      int total_pages});
}

/// @nodoc
class __$$_SearchJokeResultCopyWithImpl<$Res>
    extends _$SearchJokeResultCopyWithImpl<$Res, _$_SearchJokeResult>
    implements _$$_SearchJokeResultCopyWith<$Res> {
  __$$_SearchJokeResultCopyWithImpl(
      _$_SearchJokeResult _value, $Res Function(_$_SearchJokeResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? limit = null,
    Object? next_page = null,
    Object? previous_page = null,
    Object? jokes = null,
    Object? search_term = null,
    Object? status = null,
    Object? total_jokes = null,
    Object? total_pages = null,
  }) {
    return _then(_$_SearchJokeResult(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      next_page: null == next_page
          ? _value.next_page
          : next_page // ignore: cast_nullable_to_non_nullable
              as int,
      previous_page: null == previous_page
          ? _value.previous_page
          : previous_page // ignore: cast_nullable_to_non_nullable
              as int,
      jokes: null == jokes
          ? _value._jokes
          : jokes // ignore: cast_nullable_to_non_nullable
              as List<Joke>,
      search_term: null == search_term
          ? _value.search_term
          : search_term // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      total_jokes: null == total_jokes
          ? _value.total_jokes
          : total_jokes // ignore: cast_nullable_to_non_nullable
              as int,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchJokeResult implements _SearchJokeResult {
  const _$_SearchJokeResult(
      {required this.current_page,
      required this.limit,
      required this.next_page,
      required this.previous_page,
      @JsonKey(name: 'results') required final List<Joke> jokes,
      required this.search_term,
      required this.status,
      required this.total_jokes,
      required this.total_pages})
      : _jokes = jokes;

  factory _$_SearchJokeResult.fromJson(Map<String, dynamic> json) =>
      _$$_SearchJokeResultFromJson(json);

  @override
  final int current_page;
  @override
  final int limit;
  @override
  final int next_page;
  @override
  final int previous_page;
  final List<Joke> _jokes;
  @override
  @JsonKey(name: 'results')
  List<Joke> get jokes {
    if (_jokes is EqualUnmodifiableListView) return _jokes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jokes);
  }

  @override
  final String search_term;
  @override
  final int status;
  @override
  final int total_jokes;
  @override
  final int total_pages;

  @override
  String toString() {
    return 'SearchJokeResult(current_page: $current_page, limit: $limit, next_page: $next_page, previous_page: $previous_page, jokes: $jokes, search_term: $search_term, status: $status, total_jokes: $total_jokes, total_pages: $total_pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchJokeResult &&
            (identical(other.current_page, current_page) ||
                other.current_page == current_page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next_page, next_page) ||
                other.next_page == next_page) &&
            (identical(other.previous_page, previous_page) ||
                other.previous_page == previous_page) &&
            const DeepCollectionEquality().equals(other._jokes, _jokes) &&
            (identical(other.search_term, search_term) ||
                other.search_term == search_term) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total_jokes, total_jokes) ||
                other.total_jokes == total_jokes) &&
            (identical(other.total_pages, total_pages) ||
                other.total_pages == total_pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      current_page,
      limit,
      next_page,
      previous_page,
      const DeepCollectionEquality().hash(_jokes),
      search_term,
      status,
      total_jokes,
      total_pages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchJokeResultCopyWith<_$_SearchJokeResult> get copyWith =>
      __$$_SearchJokeResultCopyWithImpl<_$_SearchJokeResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchJokeResultToJson(
      this,
    );
  }
}

abstract class _SearchJokeResult implements SearchJokeResult {
  const factory _SearchJokeResult(
      {required final int current_page,
      required final int limit,
      required final int next_page,
      required final int previous_page,
      @JsonKey(name: 'results') required final List<Joke> jokes,
      required final String search_term,
      required final int status,
      required final int total_jokes,
      required final int total_pages}) = _$_SearchJokeResult;

  factory _SearchJokeResult.fromJson(Map<String, dynamic> json) =
      _$_SearchJokeResult.fromJson;

  @override
  int get current_page;
  @override
  int get limit;
  @override
  int get next_page;
  @override
  int get previous_page;
  @override
  @JsonKey(name: 'results')
  List<Joke> get jokes;
  @override
  String get search_term;
  @override
  int get status;
  @override
  int get total_jokes;
  @override
  int get total_pages;
  @override
  @JsonKey(ignore: true)
  _$$_SearchJokeResultCopyWith<_$_SearchJokeResult> get copyWith =>
      throw _privateConstructorUsedError;
}
