import 'package:linear_algebra/src/core/exceptions.dart';
import 'package:linear_algebra/src/vector/vector.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final inputDouble = <double>[1.0, 2.1, 3.1, 4.1];
  final inputInteger = <int>[1, 2, 3, 4];
  final emptyInput = <num>[];

  test('should throws ValueException when it called with empty input',
          () async {
        // assert
        expect(
              () => Vector(coordinates: emptyInput),
          throwsA(isA<ValueException>()),
        );
      });

  group('double vector', () {
    test('should be instance of Vector when it called with list of doubles',
            () async {
          // act
          final actual = Vector(coordinates: inputDouble);
          // assert
          expect(actual, TypeMatcher<Vector>());
        });

    test(
        'should be a string which represent a vector of doubles when call to string',
            () async {
          // arrange
          final vector = Vector(coordinates: inputDouble);
          // act
          final actual = vector.toString();
          // assert
          expect(actual, "Vector: [1.0, 2.1, 3.1, 4.1]");
        });

    test(
        'should be a string which represent a vector of doubles when call to string',
            () async {
          // arrange
          final vector = Vector(coordinates: inputDouble);
          // act
          final actual = vector.toString();
          // assert
          expect(actual, "Vector: [1.0, 2.1, 3.1, 4.1]");
        });

    test('should return vector which is sum of two vectors', () async {
      // arrange
      final vectorOne = Vector(coordinates: [8.218, -9.341]);
      final vectorTwo = Vector(coordinates: [-1.129, 2.111]);
      // act
      final actual = vectorOne.plus(vectorTwo);
      // assert
      expect(actual, Vector(coordinates: [7.089, -7.230]));
    });

    test('should return vector which is minus of two vectors', () async {
      // arrange
      final vectorOne = Vector(coordinates: [7.119, 8.215]);
      final vectorTwo = Vector(coordinates: [-8.223, 0.878]);
      // act
      final actual = vectorOne.minus(vectorTwo);
      // assert
      expect(actual, Vector(coordinates: [15.342, 7.337]));
    });

    test('should return vector which is scalar of vector by number', () async {
      // arrange
      final vectorOne = Vector(coordinates: [1.671, -1.012, -0.318]);
      final number = 7.41;
      // act
      final actual = vectorOne.scalar(number);
      // assert
      expect(actual, Vector(coordinates: [12.382, -7.499, -2.356]));
    });
  });

  group('integer vector', () {
    test('should be instance of Vector when it called with list of integers',
            () async {
          // act
          final actual = Vector(coordinates: inputInteger);
          // assert
          expect(actual, TypeMatcher<Vector>());
        });

    test(
        'should be a string which represent a vector of integers when call to string',
            () async {
          // arrange
          final vector = Vector(coordinates: inputInteger);
          // act
          final actual = vector.toString();
          // assert
          expect(actual, "Vector: [1, 2, 3, 4]");
        });

    test('should be equal to vector when input is same vector', () async {
      // arrange
      final vectorOne = Vector(coordinates: inputInteger);
      final vectorTwo = Vector(coordinates: [1, 2, 3, 4]);
      // act
      final actual = vectorOne == vectorTwo;
      // assert
      expect(actual, true);
    });

    test('should be not equal to vector when input is different', () async {
      // arrange
      final vectorOne = Vector(coordinates: inputInteger);
      final vectorTwo = Vector(coordinates: [1, 2, 3, 5]);
      // act
      final actual = vectorOne == vectorTwo;
      // assert
      expect(actual, false);
    });
  });
}
