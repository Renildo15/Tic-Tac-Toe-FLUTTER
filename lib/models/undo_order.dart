import 'package:jogo_da_velha/models/board_tiles.dart';
import 'package:jogo_da_velha/models/order.dart';
import 'package:jogo_da_velha/enums/player_type.dart';

class UndoOrder implements Order {
  late PlayerType currentPlayer;
  List<BoardTile> tiles = [];
  List<BoardTile> moveHistory = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];

  UndoOrder(
      List<BoardTile> gameTiles,
      List<BoardTile> gameMoveHistory,
      List<int> gameMovesPlayer1,
      List<int> gameMovesPlayer2,
      PlayerType gameCurrentPlayer) {
    tiles = gameTiles;
    moveHistory = gameMoveHistory;
    movesPlayer1 = gameMovesPlayer1;
    movesPlayer2 = gameMovesPlayer2;
    currentPlayer = gameCurrentPlayer;
  }

  @override
  void execute() {
    if (moveHistory.isEmpty) return;

    final lastTile = moveHistory.last;

    lastTile.reset();

    if (currentPlayer == PlayerType.player1) {
      movesPlayer2.removeLast();
      currentPlayer = PlayerType.player2;
    } else {
      movesPlayer1.removeLast();
      currentPlayer = PlayerType.player1;
    }

    moveHistory.removeLast();
  }

  List<BoardTile> getTiles() {
    return tiles;
  }

  List<BoardTile> getMoveHistory() {
    return moveHistory;
  }

  List<int> getMovesPlayer1() {
    return movesPlayer1;
  }

  List<int> getMovesPlayer2() {
    return movesPlayer2;
  }

  PlayerType getCurrentPlayer() {
    return currentPlayer;
  }
}
