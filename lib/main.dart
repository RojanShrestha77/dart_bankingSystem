import 'package:banking_system/bank_class.dart';
import 'package:banking_system/checking_account.dart';
import 'package:banking_system/premium_account.dart';
import 'package:banking_system/saving_account.dart';

void main() {
  var bank = Bank();

  var savings = SavingAccount(
    accountNumber: 101,
    accountHolderName: "Alice",
    balance: 1000,
  );
  var checking = CheckingAccount(
    accountNumber: 102,
    accountHolderName: "Bob",
    balance: 500,
  );
  var premium = PremiumAccount(
    accountNumber: 103,
    accountHolderName: "Charlie",
    balance: 20000,
  );

  bank.addAccount(savings);
  bank.addAccount(checking);
  bank.addAccount(premium);

  savings.withdraw(100);
  checking.withdraw(600); // triggers overdraft
  premium.deposit(5000);

  bank.transfer(101, 102, 200);

  bank.generateReport();
}
