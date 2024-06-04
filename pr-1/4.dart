void main() {
  // Define two 3x3 matrices
  List<List<int>> matrix1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  List<List<int>> matrix2 = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1],
  ];

  // Initialize a result matrix with zeros
  List<List<int>> result = List.generate(3, (_) => List.filled(3, 0));

  // Perform matrix addition
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      result[i][j] = matrix1[i][j] + matrix2[i][j];
    }
  }

  // Print the result matrix
  print('Resultant matrix after addition:');
  for (int i = 0; i < 3; i++) {
    print(result[i]);
  }
}