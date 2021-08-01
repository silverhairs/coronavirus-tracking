abstract class HiveRepository<T> {
  Future<void> write(T object);

  List<T> readAll();

  Future<void> clean();
}

class DuplicateItemException implements Exception {}
