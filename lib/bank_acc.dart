abstract class BankAccount {
  int _accountNumber;
  String _accountHolderName;
  double _balance;

  //construtor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  int get getaccountNumber => _accountNumber;
  String get getaccountHolderName => _accountHolderName;
  double get getbalance => _balance;

  double deposit();
  double withdraw();
}
