import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage{
  String id;
  String filename;
  String? title;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelfordImage(
      {
        this.title,
        required this.filename,
        required this.urlSmallSize,
        required this.urlFullSize,
        required this.id
      });

  factory PixelfordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelFormImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}