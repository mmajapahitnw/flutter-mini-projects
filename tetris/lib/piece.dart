import 'values.dart';

class Piece {
  Tetromino type;

  Piece({required this.type});

  List<int> position = [];

  void InitialPlaces() {
    switch (type) {
      case Tetromino.L:
        position = [
          4,
          14,
          24,
          25,
        ];
        break;
      default:
        break;
    }
  }
}
