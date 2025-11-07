import 'package:banking_system/bank_acc.dart';
import 'package:banking_system/interest_bearing.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 10000;

  PremiumAccount({
    required super.accountNumber,
    required super.accountHolderName,
    required super.balance,
  }) {
    if (balance < 10000) {
      throw Exception("Less than Required minimum balance");
    }
  }

  @override
  void deposit(double amount) {
    balance += amount;
    print("Deposited \$${amount.toStringAsFixed(2)}");
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < minBalance) {
      print("Sorry!Cannot withdraw. Minimum Balance must be maintained");
      return;
    }
    balance -= amount;
    print("Withdrew \$${amount.toStringAsFixed(2)}");
  }

  @override
  double calculateInterest() {
    return balance * 0.05;
  }
}
