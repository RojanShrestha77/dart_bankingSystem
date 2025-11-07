abstract class BankAccount {
  final int _accountNumber;
  String _accountHolderName;
  double balance; // make it public for children

  BankAccount({
    required int accountNumber,
    required String accountHolderName,
    required this.balance,
  }) : _accountNumber = accountNumber,
       _accountHolderName = accountHolderName;

  int get accountNumber => _accountNumber;

  void deposit(double amount);
  void withdraw(double amount);

  void displayInfo() {
    print('Account Number: $_accountNumber');
    print('Account Holder: $_accountHolderName');
    print('Balance: $balance');
  }
}
