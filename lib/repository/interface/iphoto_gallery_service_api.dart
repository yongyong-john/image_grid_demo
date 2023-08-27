import 'package:http/http.dart' as http;
import 'package:image_grid_demo_app/common/detect_platform.dart';
import 'package:image_grid_demo_app/constants/consts.dart';

part 'package:image_grid_demo_app/repository/api/photo_gallery_service_api.dart';

abstract class IPhotoGalleryServiceApiRepository {
  Future<http.Response> getGalleryListApi({required num pageNo});
}
