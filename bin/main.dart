// Challenge 1
// Write test cases for the given challenges

// Challenge - Conway's Game of Life
// https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Rules
// The Game of Life, also known simply as Life, is a cellular automaton devised
// by the British mathematician John Horton Conway in 1970.
// Write a function which performs one step of the life algorithm
List<List<bool>> gameOfLife(List<List<bool>> board) {
  //to create new board with all values as false
  //lets copy the board first
  List<List<bool>> newBoard = board;
  //now change all values to false, dead
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      newBoard[i][j] = false;
    }
  }
  print('here');
  print(board);
  print(newBoard);
  //now lets go through board and update values in new board
  //by following rules from Conway's Game of Life
//  /  Any live cell with fewer than two live neighbours dies, as if by underpopulation.
//  /  Any live cell with two or three live neighbours lives on to the next generation.
//  / Any live cell with more than three live neighbours dies, as if by overpopulation.
//  /  Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  for (int i = 0; i < board.length; i++) {
//    print('first loop');
    for (int j = 0; j < board[i].length; j++) {
//      print('2nd loop');
//      print(board[i][j]);
      if (board[i][j] == true && nearbyTrue(i, j, board) < 2) {
        print('rule 1');
        newBoard[i][j] = false;
      } else if (board[i][j] == true && nearbyTrue(i, j, board) == 2) {
        print('rule 2');
        newBoard[i][j] = true;
      } else if (board[i][j] == true && nearbyTrue(i, j, board) == 3) {
        print('rule 2');
        newBoard[i][j] = true;
      } else if (board[i][j] == true && nearbyTrue(i, j, board) > 3) {
        print('rule 3');
        newBoard[i][j] = false;
      } else if (board[i][j] == false && nearbyTrue(i, j, board) == 3) {
        print('rule 4');
        newBoard[i][j] = true;
      }
    }
  }
  print('here again');

  return newBoard;
}

int nearbyTrue(int i, int j, List<List> board) {
  int count = 0;
  try {
    for (int offsetX = -1; offsetX < 2; offsetX++) {
      for (int offsetY = -1; offsetY < 2; offsetY++) {
        if (i + offsetX < 0 ||
//            i + offsetX >= board[i].length ||
            i + offsetX >= board.length ||
            j + offsetY < 0 ||
            j + offsetY >= board[i + offsetX].length) {
          //do nothing, basically skip those values
        } else if (board[i + offsetX][j + offsetY] == true) {
          count++;
        }
      }
    }
  } catch (e) {
    print(e);
  }
  return count;
}

int nearbyFalse(int i, int j, List<List> board) {
  int count = 0;
  try {
    for (int offsetX = -1; offsetX < 2; offsetX++) {
      for (int offsetY = -1; offsetY < 2; offsetY++) {
        if (i + offsetX < 0 ||
//            i + offsetX >= board[i].length ||
            i + offsetX >= board.length ||
            j + offsetY < 0 ||
            j + offsetY >= board[i + offsetX].length) {
          //do nothing, basically skip those values
        } else if (board[i + offsetX][j + offsetY] == false) {
          count++;
        }
      }
    }
  } catch (e) {
    print(e);
  }
  return count;
}

main() {
  print(nearbyTrue(1, 1, [
    [false, true, false, true],
    [false, false, true, false],
    [false, true, false, false],
    [true, false, true, false]
  ]));
}
