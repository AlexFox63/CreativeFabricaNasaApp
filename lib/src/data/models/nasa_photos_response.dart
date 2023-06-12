import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/camera.dart';
import '../../domain/entities/photo.dart';
import '../../domain/entities/rover.dart';

part 'nasa_photos_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NasaPhotosResponse {
  final List<PhotoModel> photos;

  NasaPhotosResponse({required this.photos});

  factory NasaPhotosResponse.fromJson(Map<String, dynamic> json) =>
      _$NasaPhotosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NasaPhotosResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoModel {
  final int id;
  final int sol;
  final CameraModel camera;
  final String imgSrc;
  final String earthDate;
  final RoverModel rover;

  PhotoModel({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);

  Photo toEntity() => Photo(
        id: id,
        sol: sol,
        camera: camera.toEntity(),
        imgUrl: imgSrc,
        earthDate: earthDate,
        rover: rover.toEntity(),
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CameraModel {
  final int id;
  final String name;
  final int roverId;
  final String fullName;

  CameraModel({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory CameraModel.fromJson(Map<String, dynamic> json) => _$CameraModelFromJson(json);

  Map<String, dynamic> toJson() => _$CameraModelToJson(this);

  Camera toEntity() => Camera(
        id: id,
        name: name,
        roverId: roverId,
        fullName: fullName,
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RoverModel {
  final int id;
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;

  RoverModel({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  factory RoverModel.fromJson(Map<String, dynamic> json) => _$RoverModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoverModelToJson(this);

  Rover toEntity() => Rover(
        id: id,
        name: name,
        landingDate: landingDate,
        launchDate: launchDate,
        status: status,
      );
}
