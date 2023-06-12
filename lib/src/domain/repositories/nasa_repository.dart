import '../entities/photo.dart';

// ignore: one_member_abstracts
abstract interface class NasaRepository {
  Future<List<Photo>> getCuriosityPhotos();
}
