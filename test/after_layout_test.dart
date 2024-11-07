import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mt_after_layout/mt_after_layout.dart';

void main() {
  testWidgets('TestWidget', (WidgetTester tester) async {
    int runCount = 0;
    await tester.pumpWidget(TestWidget(callback: () => runCount++));
    expect(runCount, 1);
  });
}

@immutable
class TestWidget extends StatefulWidget {
  const TestWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final VoidCallback callback;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with MtAfterLayoutMixin<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void mtAfterFirstLayout(BuildContext context) {
    widget.callback();
  }
}
