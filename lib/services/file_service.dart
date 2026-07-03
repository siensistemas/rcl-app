import 'package:image_picker/image_picker.dart';

class FileService {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage({ImageSource source = ImageSource.gallery}) async {
    final image = await _picker.pickImage(source: source, maxWidth: 1920, maxHeight: 1920);
    return image?.path;
  }

  Future<List<String>> pickMultipleImages() async {
    final images = await _picker.pickMultiImage();
    return images.map((image) => image.path).toList();
  }

  Future<String?> uploadImage(String filePath) async {
    // Implementar subida de imagen al servidor
    return null;
  }
}
