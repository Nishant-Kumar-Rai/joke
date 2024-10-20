// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_joke_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchJokeResult _$$_SearchJokeResultFromJson(Map<String, dynamic> json) =>
    _$_SearchJokeResult(
      current_page: json['current_page'] as int,
      limit: json['limit'] as int,
      next_page: json['next_page'] as int,
      previous_page: json['previous_page'] as int,
      jokes: (json['results'] as List<dynamic>)
          .map((e) => Joke.fromJson(e as Map<String, dynamic>))
          .toList(),
      search_term: json['search_term'] as String,
      status: json['status'] as int,
      total_jokes: json['total_jokes'] as int,
      total_pages: json['total_pages'] as int,
    );

Map<String, dynamic> _$$_SearchJokeResultToJson(_$_SearchJokeResult instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'limit': instance.limit,
      'next_page': instance.next_page,
      'previous_page': instance.previous_page,
      'results': instance.jokes,
      'search_term': instance.search_term,
      'status': instance.status,
      'total_jokes': instance.total_jokes,
      'total_pages': instance.total_pages,
    };
