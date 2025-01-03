void printMessage(String message) {
  print(message);
}
void addAndPrint(int a, int b) {
  int sum = a + b;
  print('The sum of $a and $b is $sum.');
}

void main() {
  printMessage('Hello, I am John!');
  addAndPrint(10, 5);
}

// output:
// Hello, I am John!
// The sum of 10 and 5 is 15.