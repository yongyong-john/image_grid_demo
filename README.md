# image_grid_demo_app

공공데이터포털 자료인 한국관광공사 관광사진을 보여주는 앱

메인화면

![Image Grid Page](https://github.com/yongyong-john/image_grid_demo/blob/main/images/image_grid.PNG?raw=true)

이미지 상세화면

![Image Details Page](https://github.com/yongyong-john/image_grid_demo/blob/main/images/image_details.PNG?raw=true)

이미지 줌인/줌아웃 화면

![Image Viewer Page](https://github.com/yongyong-john/image_grid_demo/blob/main/images/iage_viewer.PNG?raw=true)

위의 세 화면으로 구성된 앱입니다.

공공데이터포털의 한국관광공사가 지원하는 관광사진 API를 사용했습니다.
https://www.data.go.kr/data/15101914/openapi.do#/API%20%EB%AA%A9%EB%A1%9D/galleryList1

위 API에서 제공하는 데이터 중 사진 제목, 사진 Url, 사진 장소, 사진 상세 정보를 가져와 사용합니다.
또한, 한 번에 받아오는 이미지는 30개로 스크롤마다 pageNumber를 추가하여 API를 통해 다음의 이미지를 계속 받아옵니다.

UI와 Busniss logic을 분리하고 Bloc design pattern을 사용하여 화면과 API 사용 코드를 분리했습니다.
