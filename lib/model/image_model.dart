import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelFormImage{
  String id;
  String fileName;
  String? title;
  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelFormImage(
      {
        this.title,
        required this.fileName,
        required this.urlSmallSize,
        required this.urlFullSize,
        required this.id
      });

  factory PixelFormImage.fromJson(Map<String, dynamic> json) =>
      _$PixelFormImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}