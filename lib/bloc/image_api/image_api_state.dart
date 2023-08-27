import 'package:equatable/equatable.dart';

abstract class ImageApiState extends Equatable {}

class ImageApiInitial extends ImageApiState {
  @override
  List<Object?> get props => [];
}

class ImageApiLoading extends ImageApiState {
  @override
  List<Object?> get props => [];
}

class ImageApiSuccess extends ImageApiState {
  final dynamic items;
  final int pageNo;
  ImageApiSuccess({required this.items, required this.pageNo});

  @override
  List<Object?> get props => [items, pageNo];
}
