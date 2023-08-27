abstract class ImageApiEvent {}

class GetImageApiInfo extends ImageApiEvent {
  final num pageNumber;
  GetImageApiInfo(this.pageNumber);
}
