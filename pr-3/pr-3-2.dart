import 'dart:io';

class Product {
  String id;
  String name;
  int quantity;
  double price;

  Product(this.id, this.name, this.quantity, this.price);
}

class Customer {
  String id;
  String name;
  String contact;
  List<Product> cart = [];

  Customer(this.id, this.name, this.contact);
}

void main() {
  List<Customer> customers = [];

  while (true) {
    print("\n1. Add Customer");
    print("2. Display Products and Add to Cart");
    print("3. Calculate Bill");
    print("4. Search Customer by ID");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addCustomer(customers);
        break;
      case 2:
        displayProductsAndAddToCart(customers);
        break;
      case 3:
        calculateBill(customers);
        break;
      case 4:
        searchCustomerByID(customers);
        break;
      case 5:
        exit(0);
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

void addCustomer(List<Customer> customers) {
  stdout.write("Enter Customer ID: ");
  var id = stdin.readLineSync()!;
  stdout.write("Enter Customer Name: ");
  var name = stdin.readLineSync()!;
  stdout.write("Enter Customer Contact: ");
  var contact = stdin.readLineSync()!;
  var customer = Customer(id, name, contact);
  customers.add(customer);
}

void displayProductsAndAddToCart(List<Customer> customers) {
  print("\nCategories:");
  print("1. Electronics");
  print("2. Groceries");
  // Add more categories if needed

  stdout.write("Enter Category: ");
  var category = int.parse(stdin.readLineSync()!);

  switch (category) {
    case 1:
      // Show electronics products
      break;
    case 2:
      // show  groceries products
      break;
    // Add cases  other categories
    default:
      print("Invalid category.");
  }

  stdout.write("Enter Product ID to add to cart: ");
  var productId = stdin.readLineSync()!;
}

void calculateBill(List<Customer> customers) {
  stdout.write("Enter Customer ID: ");
  var customerId = stdin.readLineSync()!;
  var customer = customers.firstWhere((c) => c.id == customerId,
      orElse: () => throw "Customer not found");

  double totalAmount = 0;
  for (var product in customer.cart) {
    totalAmount += product.price * product.quantity;
  }

  double discount = calculateDiscount(totalAmount);

  double finalAmount = totalAmount - discount;

  print("Total Amount: \$${totalAmount.toStringAsFixed(2)}");
  print("Discount: \$${discount.toStringAsFixed(2)}");
  print("Final Amount: \$${finalAmount.toStringAsFixed(2)}");
}

double calculateDiscount(double totalAmount) {
  if (totalAmount >= 500 && totalAmount < 1500) {
    return totalAmount * 0.1;
  } else if (totalAmount >= 1500 && totalAmount < 3500) {
    return totalAmount * 0.2;
  } else if (totalAmount >= 3500 && totalAmount < 6500) {
    return totalAmount * 0.25;
  } else if (totalAmount >= 6500) {
    return totalAmount * 0.3;
  } else {
    return 0;
  }
}

void searchCustomerByID(List<Customer> customers) {
  stdout.write("Enter Customer ID: ");
  var customerId = stdin.readLineSync()!;
  var customer = customers.firstWhere((c) => c.id == customerId,
      orElse: () => throw "Customer not found");

  print("Customer ID: ${customer.id}");
  print("Customer Name: ${customer.name}");
  print("Customer Contact: ${customer.contact}");
  print("Products in Cart:");
  for (var product in customer.cart) {
    print(
        "Product ID: ${product.id}, Name: ${product.name}, Quantity: ${product.quantity}, Price: ${product.price}");
  }
  // Calculate and display total amount, discount, and final amount
}