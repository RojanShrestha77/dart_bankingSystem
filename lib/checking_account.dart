import 'package:banking_system/bank_acc.dart';

class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35;

  CheckingAccount({
    required super.accountNumber,
    required super.accountHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    balance += amount;
  }

  @override
  void withdraw(double amount) {
    balance -= amount;
    if (balance < 0) {
      balance -= overdraftFee;
      print("Overdraft! Fee \$$overdraftFee applied.");
    }
    print("Withdrew \$${amount.toStringAsFixed(2)}");
  }
}
