// bank_account.dart
abstract class BankAccount {
  int _accountNumber;
  String _accountHolderName;
  double _balance;

  BankAccount({
    required int accountNumber,
    required String accountHolderName,
    required double balance,
  }) : _accountNumber = accountNumber,
       _accountHolderName = accountHolderName,
       _balance = balance;

  // Getters
  int get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;

  // Setters (with validation)
  set accountHolderName(String name) => _accountHolderName = name;

  set balance(double value) {
    if (value < 0) {
      throw Exception('Balance cannot be negative');
    }
    _balance = value;
  }

  // Abstract methods
  void deposit(double amount);
  void withdraw(double amount);

  // Concrete method
  void displayInfo() {
    print('Account Number: $_accountNumber');
    print('Account Holder: $_accountHolderName');
    print('Balance: $_balance');
  }
}
