import 'package:covid19_api/src/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('HttpException', () {
    test('returns constructor normally', () {
      expect(() => HttpException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        HttpException('Failed').toString(),
        equals('HttpException(Failed)'),
      );
    });
  });

  group('HttpRequestFailure', () {
    test('returns constructor normally', () {
      expect(() => HttpRequestFailure(404), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        HttpRequestFailure(404, 'Oops').toString(),
        equals('HttpRequestFailure(Oops)'),
      );
    });
  });

  group('JsonDecodeException', () {
    test('returns constructor normally', () {
      expect(() => JsonDecodeException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        JsonDecodeException('failed').toString(),
        equals('JsonDecodeException(failed)'),
      );
    });
  });

  group('JsonDeserializeException', () {
    test('returns constructor normallt', () {
      expect(() => JsonDeserializeException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        JsonDeserializeException('failed').toString(),
        equals('JsonDeserializeException(failed)'),
      );
    });
  });
}
