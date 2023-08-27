import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_event.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_state.dart';
import 'package:image_grid_demo_app/repository/interface/iphoto_gallery_service_api.dart';

class ImageApiBloc extends Bloc<ImageApiEvent, ImageApiState> {
  ImageApiBloc({required IPhotoGalleryServiceApiRepository photoGalleryServiceApiRepository})
      : _photoGalleryServiceApiRepository = photoGalleryServiceApiRepository,
        super(ImageApiInitial()) {
    on<GetImageApiInfo>(_onGetImageApiInfo);
  }

  final IPhotoGalleryServiceApiRepository _photoGalleryServiceApiRepository;

  Future<void> _onGetImageApiInfo(GetImageApiInfo event, Emitter<ImageApiState> emit) async {
    emit(ImageApiLoading());
    var response = await _photoGalleryServiceApiRepository.getGalleryListApi(pageNo: event.pageNumber);

    print('response statusCode=${response.statusCode}');
    final responseBody = utf8.decode(response.bodyBytes);
    var data = json.decode(responseBody);
    print('response body=${data.toString()}');
    var items = data["response"]["body"]["items"]["item"];
    var pageNo = data["response"]["body"]["pageNo"];
    emit(ImageApiSuccess(items: items, pageNo: pageNo));
  }
}
