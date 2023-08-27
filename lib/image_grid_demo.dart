import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_bloc.dart';
import 'package:image_grid_demo_app/repository/interface/iphoto_gallery_service_api.dart';
import 'package:image_grid_demo_app/view/image_grid.dart';

class ImageGirdDemo extends StatefulWidget {
  const ImageGirdDemo({Key? key}) : super(key: key);

  @override
  State<ImageGirdDemo> createState() => _ImageGirdDemo();
}

class _ImageGirdDemo extends State<ImageGirdDemo> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageApiBloc>(
          create: (BuildContext context) => ImageApiBloc(
            photoGalleryServiceApiRepository: PhotoGalleryServiceApi(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: ImageGridView(),
      ),
    );
  }
}
