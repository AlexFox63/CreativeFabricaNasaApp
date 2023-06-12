import 'camera.dart';
import 'rover.dart';

class Photo {
  final int id;
  final int sol;
  final Camera camera;
  final String imgUrl;
  final String earthDate;
  final Rover rover;

  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgUrl,
    required this.earthDate,
    required this.rover,
  });
}
