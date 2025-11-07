abstract class BankAccount {
  int _accountNumber;
  String _accountHolderName;
  double _balance;

  //construtor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  int get getaccountNumber => _accountNumber;
  String get getaccountHolderName => _accountHolderName;
  double get getbalance => _balance;

  void deposit(double amount);
  void withdraw(double amount);
  void displayinfo() {
    print("Account Number: $_accountNumber");
    print("Account Holder: $_accountHolderName");
    print("Account Balance: $_balance");
  }
}
