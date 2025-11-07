import 'package:banking_system/bank_acc.dart';

class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35;

  CheckingAccount({
    required int accountNumber,
    required String accountHolderName,
    required double balance,
  }) : super(
         accountNumber: accountNumber,
         accountHolderName: accountHolderName,
         balance: balance,
       );

  @override
  void deposit(double amount) {
    balance += amount;
    print("Deposited \$${amount.toStringAsFixed(2)}");
  }

  @override
  void withdraw(double amount) {
    balance -= amount;
    if (balance < 0) {
      balance -= overdraftFee;
      print("Overdraft! Fee \$${overdraftFee} applied.");
    }
    print("Withdrew \$${amount.toStringAsFixed(2)}");
  }
}
