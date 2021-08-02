import 'package:covid19_api/src/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('HttpException', () {
    test('returns constructor normally', () {
      expect(() => const HttpException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const HttpException('Failed').toString(),
        equals('HttpException(Failed)'),
      );
    });
  });

  group('HttpRequestFailure', () {
    test('returns constructor normally', () {
      expect(() => const HttpRequestFailure(404), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const HttpRequestFailure(404, 'Oops').toString(),
        equals('HttpRequestFailure(Oops)'),
      );
    });
  });

  group('JsonDecodeException', () {
    test('returns constructor normally', () {
      expect(() => const JsonDecodeException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const JsonDecodeException('failed').toString(),
        equals('JsonDecodeException(failed)'),
      );
    });
  });

  group('JsonDeserializeException', () {
    test('returns constructor normallt', () {
      expect(() => const JsonDeserializeException(), returnsNormally);
    });

    test('has concise toString', () {
      expect(
        const JsonDeserializeException('failed').toString(),
        equals('JsonDeserializeException(failed)'),
      );
    });
  });
}
