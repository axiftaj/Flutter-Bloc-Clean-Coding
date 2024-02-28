import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@Freezed()
class MovieListModel with _$MovieListModel {

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory MovieListModel({
    @Default('') String total,
    @Default(0) int page ,
    @Default(0) int pages,
    @Default([])  @JsonKey(name: 'tv_shows') List<TvShows> tvShow

}) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) => _$MovieListModelFromJson(json);
}

@Freezed()
class TvShows with _$TvShows {

  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name,
    @Default('') String permalink ,
    @Default('') String endDate,
    @Default('') String network,
    @Default('') String imageThumbnailPath,
    @Default('') String status,

  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);
}