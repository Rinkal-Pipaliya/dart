import 'dart:io';

void insertElement(List<int> numbers) {
  stdout.write("Enter the number to insert: ");
  int number = int.parse(stdin.readLineSync()?? "0");
  numbers.add(number);
  print("$number inserted successfully.");
}

void deleteElement(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Array is empty. Nothing to delete.");
    return;
  }

  viewElements(numbers);
  stdout.write("Enter the index to delete (0-${numbers.length - 1}): ");
  int index = int.parse(stdin.readLineSync() ?? "0");

  if (index < 0 || index >= numbers.length) {
    print("Invalid index!!!");
    return;
  }

  int deletedNumber = numbers.removeAt(index);
  print("$deletedNumber deleted successfully.");
}

void updateElement(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Array is empty. Nothing to update.");
    return;
  }

  viewElements(numbers);
  stdout.write("Enter the index to update (0-${numbers.length - 1}): ");
  int index = int.parse(stdin.readLineSync()?? "0");

  if (index < 0 || index >= numbers.length) {
    print("Invalid index!!!");
    return;
  }

  stdout.write("Enter the new value: ");
  int newValue = int.parse(stdin.readLineSync()?? "0");
  numbers[index] = newValue;
  print("Value updated successfully.");
}

void viewElements(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Array is empty.");
    return;
  }

  print("\nArray Elements:");
  for (int i = 0; i < numbers.length; i++) {
    print("$i: ${numbers[i]}");
  }
}

void main() {
  List<int> numbers = [];

  while (true) {
    print("\nMenu:");
    print("1. Insert Element");
    print("2. Delete Element");
    print("3. Update Element");
    print("4. View Elements");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        insertElement(numbers);
        break;
      case '2':
        deleteElement(numbers);
        break;
      case '3':
        updateElement(numbers);

        break;
      case '4':
        viewElements(numbers);
        break;
      case '5':
        exit(0);
      default:
        print("Invalid choice! Please try again.");
    }
  }
}