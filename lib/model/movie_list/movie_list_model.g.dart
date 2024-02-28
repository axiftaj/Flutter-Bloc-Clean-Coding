// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieListModelImpl _$$MovieListModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieListModelImpl(
      total: json['total'] as String? ?? '',
      page: json['page'] as int? ?? 0,
      pages: json['pages'] as int? ?? 0,
      tvShow: (json['tv_shows'] as List<dynamic>?)
              ?.map((e) => TvShows.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieListModelImplToJson(
        _$MovieListModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShow,
    };

_$TvShowsImpl _$$TvShowsImplFromJson(Map<String, dynamic> json) =>
    _$TvShowsImpl(
      name: json['name'] as String? ?? '',
      permalink: json['permalink'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      network: json['network'] as String? ?? '',
      imageThumbnailPath: json['imageThumbnailPath'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$TvShowsImplToJson(_$TvShowsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'permalink': instance.permalink,
      'endDate': instance.endDate,
      'network': instance.network,
      'imageThumbnailPath': instance.imageThumbnailPath,
      'status': instance.status,
    };
