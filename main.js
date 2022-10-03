const boardSize = 8;                                    // constant that sets the number of rows and columns

window.onload = function () {
  createDefaultBoard();
};

function createDefaultBoard() {
  for (let i = 0; i < boardSize; i++) {
    for (let j = 0; j < boardSize; j++) {
      let div = document.createElement("div");
      div.id = i + "-" + j;                             // sets the id depending on the position of the cell in the board
      defaultBoard.appendChild(div);
    }
  }
}
