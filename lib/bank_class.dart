import 'package:banking_system/bank_acc.dart';
import 'package:banking_system/interest_bearing.dart';

class Bank {
  List<BankAccount> accounts = [];

  void addAccount(BankAccount account) {
    accounts.add(account);
    print("Account Added");
  }

  BankAccount? findAccount(int accountNumber) {
    try {
      return accounts.firstWhere((acc) => acc.accountNumber == accountNumber);
    } on StateError {
      return null;
    }
  }

  void transfer(int fromAcc, int toAcc, double amount) {
    var from = findAccount(fromAcc);
    var to = findAccount(toAcc);

    if (from == null || to == null) {
      print("One of the accounts not found!");
      return;
    }

    from.withdraw(amount);
    to.deposit(amount);
    print("Transferred \$${amount.toStringAsFixed(2)} from $fromAcc to $toAcc");
  }

  void generateReport() {
    print("\n--- Bank Accounts Report ---");
    for (var acc in accounts) {
      acc.displayInfo();
      if (acc is InterestBearing) {
        print(
          "Interest: \$${(acc as InterestBearing).calculateInterest().toStringAsFixed(2)}",
        );
      }

      print("----------------------------");
    }
  }
}
