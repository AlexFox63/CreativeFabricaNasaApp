import '../../domain/entities/photo.dart';
import '../../domain/repositories/nasa_repository.dart';
import '../services/api_service.dart';

final class NasaRepositoryImpl implements NasaRepository {
  final NasaPhotosService nasaPhotosService;

  NasaRepositoryImpl({required this.nasaPhotosService});

  @override
  Future<List<Photo>> getCuriosityPhotos() async {
    try {
      final response = await nasaPhotosService.getCuriosityPhotos();
      return response.photos.map((model) => model.toEntity()).toList();
    } on Object catch (e) {
      throw Exception(e.toString());
    }
  }
}
