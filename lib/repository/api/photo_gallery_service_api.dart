part of 'package:image_grid_demo_app/repository/interface/iphoto_gallery_service_api.dart';

class PhotoGalleryServiceApi extends IPhotoGalleryServiceApiRepository {
  @override
  Future<http.Response> getGalleryListApi({required num pageNo}) async {
    var mobileOS = DetectPlatForm.getOSName();
    var packageInfo = await DetectPlatForm.getPackageInfo();
    var mobileApp = packageInfo.appName;

    Map<String, String> queryParams = {
      'MobileOS': mobileOS,
      'MobileApp': mobileApp,
      'serviceKey': serviceKey,
      '_type': 'json',
      'numOfRows': '30',
    };
    queryParams['pageNo'] = pageNo.toString();

    final Uri uri = Uri.parse(baseUrl).replace(
      queryParameters: queryParams,
    );

    var response = await http.get(uri);

    return response;
  }
}
