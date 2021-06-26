import 'package:covid19_api/src/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('HttpException', () {
    test('has concise toString', () {
      expect(
        HttpException('Failed').toString(),
        equals('HttpException(Failed)'),
      );
    });
  });

  group('HttpRequestFailure', () {
    test('has concise toString', () {
      expect(
        HttpRequestFailure(404, 'Oops').toString(),
        equals('HttpRequestFailure(Oops)'),
      );
    });
  });

  group('JsonDecodeException', () {
    test('has concise toString', () {
      expect(
        JsonDecodeException('failed').toString(),
        equals('JsonDecodeException(failed)'),
      );
    });
  });

  group('JsonDeserializeException', () {
    test('has concise toString', () {
      expect(
        JsonDeserializeException('failed').toString(),
        equals('JsonDeserializeException(failed)'),
      );
    });
  });
}
