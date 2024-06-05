import 'dart:io';

void main() {
  // Initialize the 3x3 array
  List<List<int>> array = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  while (true) {
    // Display the menu
    print('''\nMenu:
1. Sum of all elements
2. Sum of specific row
3. Sum of specific column
4. Sum of diagonal elements
5. Sum of antidiagonal elements
0. Exit''');
    stdout.write('Enter your choice: ');
    int? choice = int.parse(stdin.readLineSync()!);

    if (choice == 0) {
      break;
    }

    switch (choice) {
      case 1:
        int totalSum = sumOfAllElements(array);
        print('Sum of all elements: $totalSum');
        break;
      case 2:
        stdout.write('Enter row index (0-2): ');
        int row = int.parse(stdin.readLineSync()!);
        if (row >= 0 && row < 3) {
          int rowSum = sumOfSpecificRow(array, row);
          print('Sum of elements in row $row: $rowSum');
        } else {
          print('Invalid row index');
        }
        break;
      case 3:
        stdout.write('Enter column index (0-2): ');
        int column = int.parse(stdin.readLineSync()!);
        if (column >= 0 && column < 3) {
          int colSum = sumOfSpecificColumn(array, column);
          print('Sum of elements in column $column: $colSum');
        } else {
          print('Invalid column index');
        }
        break;
      case 4:
        int diagonalSum = sumOfDiagonalElements(array);
        print('Sum of diagonal elements: $diagonalSum');
        break;
      case 5:
        int antiDiagonalSum = sumOfAntiDiagonalElements(array);
        print('Sum of antidiagonal elements: $antiDiagonalSum');
        break;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

int sumOfAllElements(List<List<int>> array) {
  int sum = 0;
  for (var row in array) {
    for (var element in row) {
      sum += element;
    }
  }
  return sum;
}

int sumOfSpecificRow(List<List<int>> array, int row) {
  int sum = 0;
  for (var element in array[row]) {
    sum += element;
  }
  return sum;
}

int sumOfSpecificColumn(List<List<int>> array, int column) {
  int sum = 0;
  for (var row in array) {
    sum += row[column];
  }
  return sum;
}

int sumOfDiagonalElements(List<List<int>> array) {
  int sum = 0;
  for (int i = 0; i < array.length; i++) {
    sum += array[i][i];
  }
  return sum;
}

int sumOfAntiDiagonalElements(List<List<int>> array) {
  int sum = 0;
  for (int i = 0; i < array.length; i++) {
    sum += array[i][array.length - 1 - i];
  }
  return sum;
}
