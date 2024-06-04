void main() {
  List<int> numbers = [10, 5, 20, 15, 30, 25];
  
  int largest = numbers[0]; // Assume the first element is the largest
  
  for (var num in numbers) {
    if (num > largest) {
      largest = num; // Update largest if a larger element is found
    }
  }
  
  print('The largest number in the array is: $largest');
}