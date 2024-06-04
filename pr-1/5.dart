import 'dart:io';

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  while (true) {
    print('\nMenu:');
    print('1. Sum of all elements');
    print('2. Sum of specific row');
    print('3. Sum of specific column');
    print('4. Sum of diagonal elements');
    print('5. Sum of antidiagonal elements');
    print('6. Press 0 to exit');
    stdout.write('Enter your choice: ');

    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        print('Sum of all elements: ${sumOfAllElements(matrix)}');
        break;

      case 2:
        stdout.write('Enter the row index (0 to 2): ');
        var rowIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (rowIndex != null && rowIndex >= 0 && rowIndex < matrix.length) {
          print('Sum of row $rowIndex: ${sumOfRow(matrix, rowIndex)}');
        } else {
          print('Invalid row index. Please enter a valid index.');
        }
        break;

      case 3:
        stdout.write('Enter the column index (0 to 2): ');
        var columnIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (columnIndex != null && columnIndex >= 0 && columnIndex < matrix[0].length) {
          print('Sum of column $columnIndex: ${sumOfColumn(matrix, columnIndex)}');
        } else {
          print('Invalid column index. Please enter a valid index.');
        }
        break;

      case 4:
        print('Sum of diagonal elements: ${sumOfDiagonal(matrix)}');
        break;

      case 5:
        print('Sum of antidiagonal elements: ${sumOfAntidiagonal(matrix)}');
        break;

      case 6:
        print('Exiting the program. Goodbye!');
        return;

      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}

int sumOfAllElements(List<List<int>> matrix) {
  int sum = 0;
  for (var row in matrix) {
    for (var element in row) {
      sum += element;
    }
  }
  return sum;
}

int sumOfRow(List<List<int>> matrix, int rowIndex) {
  return matrix[rowIndex].reduce((value, element) => value + element);
}

int sumOfColumn(List<List<int>> matrix, int columnIndex) {
  int sum = 0;
  for (var row in matrix) {
    sum += row[columnIndex];
  }
  return sum;
}

int sumOfDiagonal(List<List<int>> matrix) {
  return matrix[0][0] + matrix[1][1] + matrix[2][2];
}

int sumOfAntidiagonal(List<List<int>> matrix) {
  return matrix[0][2] + matrix[1][1] + matrix[2][0];
}
