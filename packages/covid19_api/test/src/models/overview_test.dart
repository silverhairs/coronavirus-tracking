import 'package:covid19_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Overview', () {
    test('supports value comparisons', () {
      expect(Overview.empty, Overview.empty);
    });

    test('has concise toString', () {
      expect(Overview.empty.toString(), equals('Overview(0)'));
    });
  });
}
