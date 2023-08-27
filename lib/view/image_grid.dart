import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_bloc.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_event.dart';
import 'package:image_grid_demo_app/bloc/image_api/image_api_state.dart';
import 'package:image_grid_demo_app/view/image_detail.dart';

class ImageGridView extends StatefulWidget {
  const ImageGridView({Key? key}) : super(key: key);

  @override
  State<ImageGridView> createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(30, (index) => index);
  List<dynamic> _imageItems = [];
  int _pageNumber = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMoreData(_pageNumber);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageApiBloc, ImageApiState>(
      builder: (context, state) {
        if (state is ImageApiSuccess) {
          _pageNumber = state.pageNo;
          _imageItems += state.items;
          isLoading = false;
        }
        return Scaffold(
          appBar: AppBar(title: const Text('Image Scrolling Grid')),
          body: Stack(
            children: [
              GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  if (_imageItems.isNotEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetailView(imageItem: _imageItems[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Center(
                          child: Column(
                            children: [
                              Text(_imageItems[index]['galTitle']),
                              Image.network(
                                _imageItems[index]['galWebImageUrl'],
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                itemCount: _imageItems.length,
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreData(++_pageNumber);
    }
  }

  void _loadMoreData(int pageNumber) {
    setState(() {
      isLoading = true;
    });
    BlocProvider.of<ImageApiBloc>(context).add(GetImageApiInfo(pageNumber));
    final newItems = List.generate(30, (index) => _items.length + index);
    _items.addAll(newItems);
  }
}
