
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';


/// Freezed runner command
/// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class MoviesModel with _$MoviesModel{


  factory MoviesModel({
    @Default('') String total,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow
})= _MoviesModel;


  factory MoviesModel.fromJson(Map<String,dynamic>json)=> _$MoviesModelFromJson(json);

}

@freezed
class TvShows with _$TvShows{


  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'permalink') @Default('') String permalink,
    @JsonKey(name: 'start_date') @Default('') String startDate,
    @JsonKey(name: 'end_date') @Default('') String endDate,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'network') @Default('') String network,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'image_thumbnail_path') @Default('') String imageThumbnailPath,
  })= _TvShows;


  factory TvShows.fromJson(Map<String,dynamic>json)=> _$TvShowsFromJson(json);

}
