// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_photos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasaPhotosResponse _$NasaPhotosResponseFromJson(Map<String, dynamic> json) =>
    NasaPhotosResponse(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NasaPhotosResponseToJson(NasaPhotosResponse instance) =>
    <String, dynamic>{
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      id: json['id'] as int,
      sol: json['sol'] as int,
      camera: CameraModel.fromJson(json['camera'] as Map<String, dynamic>),
      imgSrc: json['img_src'] as String,
      earthDate: json['earth_date'] as String,
      rover: RoverModel.fromJson(json['rover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'camera': instance.camera,
      'img_src': instance.imgSrc,
      'earth_date': instance.earthDate,
      'rover': instance.rover,
    };

CameraModel _$CameraModelFromJson(Map<String, dynamic> json) => CameraModel(
      id: json['id'] as int,
      name: json['name'] as String,
      roverId: json['rover_id'] as int,
      fullName: json['full_name'] as String,
    );

Map<String, dynamic> _$CameraModelToJson(CameraModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rover_id': instance.roverId,
      'full_name': instance.fullName,
    };

RoverModel _$RoverModelFromJson(Map<String, dynamic> json) => RoverModel(
      id: json['id'] as int,
      name: json['name'] as String,
      landingDate: json['landing_date'] as String,
      launchDate: json['launch_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$RoverModelToJson(RoverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'landing_date': instance.landingDate,
      'launch_date': instance.launchDate,
      'status': instance.status,
    };
