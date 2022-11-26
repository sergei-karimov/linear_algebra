import 'dart:math';

import 'package:equatable/equatable.dart';
import '../core/exceptions.dart';

extension Ex on double {
  double toPrecision(int n) {
    int fac = pow(10, n).toInt();
    return (this * fac).round() / fac;
  }
}

class Vector extends Equatable {
  final List<num> coordinates;
  late final int dimension;

  Vector({required this.coordinates}) {
    if (coordinates.isEmpty) {
      throw ValueException('The coordinates must be nonempty');
    }
    dimension = coordinates.length;
  }

  Vector plus(Vector other) {
    if (dimension != other.dimension) {
      throw ValueException('The length of vectors must be the same');
    }

    var result = List<num>.filled(dimension, 0);
    for (var i = 0; i < dimension; i++) {
      result[i] = coordinates[i] + other.coordinates[i];
      result[i] = (result[i] as double).toPrecision(3);
    }

    return Vector(coordinates: result);
  }

  Vector minus(Vector other) {
    if (dimension != other.dimension) {
      throw ValueException('The length of vectors must be the same');
    }

    var result = List<num>.filled(dimension, 0);
    for (var i = 0; i < dimension; i++) {
      result[i] = coordinates[i] - other.coordinates[i];
      result[i] = (result[i] as double).toPrecision(3);
    }

    return Vector(coordinates: result);
  }

  Vector scalar(num number) {
    var result = List<num>.filled(dimension, 0);
    for (var i = 0; i < dimension; i++) {
      result[i] = coordinates[i] * number;
      result[i] = (result[i] as double).toPrecision(3);
    }

    return Vector(coordinates: result);
  }

  @override
  String toString() {
    return 'Vector: $coordinates';
  }

  @override
  List<Object?> get props => [coordinates, dimension];
}
