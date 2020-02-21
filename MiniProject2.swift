import Foundation

func eightQueens(boardSize :Int){
    class Board {
        var columnas:Int
        var filas:Int
        init(forRow:Int){
            filas  = forRow
            columnas = 0
        }
    }
    
    var solutionsFound = 0
    let printSolution = true
    let boardWidth = boardSize - 1
    var numOfTry = 0

    let queens:[Board] = (0...boardWidth).map{ Board(forRow: $0) }
    func isSafe(currentRow:Int, currentColumn:Int) -> Bool {
     
        for previousRow in 0 ..< currentRow {
            if queens[previousRow].columnas == currentColumn {
                return false
            }
            let dRow = currentRow - previousRow
            let dCol = currentColumn - queens[previousRow].columnas
            if dRow == dCol || dRow == -dCol {
                return false
            }
        }
        queens[currentRow].columnas = currentColumn
        return true
    }
    
    func recursiveQueens(row:Int) {
        if  numOfTry == 114 {
            print("Number of recursive calls: 114", terminator: "\n\n")
        }
        for column in 0...boardWidth {
            if isSafe(currentRow: row, currentColumn: column) {
                if row == boardWidth {
                    solutionsFound += 1
                    if printSolution {
                        printBoard()
                    }
                } else {
                    numOfTry += 1
                    recursiveQueens(row: row+1)
                }
            }
        }
    }
    
    func printBoard() {
        for currentRow in Array((0...boardWidth).relative(to: queens)) {
            print("[", terminator: "")
            for currentColumn in 0...boardWidth {
                if queens[currentRow].columnas == currentColumn {
                    print("Q ", terminator: "")
                } else {
                    print("- ", terminator: "")
                }
            }
            print("]")
        }
        print("\n")
    }
    recursiveQueens(row: 0)
    print("🇲🇽Solutions Found: \(solutionsFound)")
}
