class ValueException implements Exception {
  dynamic cause;
  ValueException([this.cause]);
}

class TypeException implements Exception {
  dynamic cause;
  TypeException([this.cause]);
}