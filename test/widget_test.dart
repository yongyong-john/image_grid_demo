import 'package:flutter_test/flutter_test.dart';

import 'package:image_grid_demo_app/view/image_grid.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ImageGridView());
  });
}
