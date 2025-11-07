import 'package:banking_system/bank_acc.dart';
import 'package:banking_system/interest_bearing.dart';

class SavingAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 500;
  int _withdrawalsThisMonth = 0;
  static const int withdrawalLimit = 3;

  SavingAccount({
    required super.accountNumber,
    required super.accountHolderName,
    required super.balance,
  }) {
    if (balance < minBalance) {
      throw Exception("Intial Balance must be at least \$500");
    }
  }

  @override
  void withdraw(double amount) {
    if (_withdrawalsThisMonth >= withdrawalLimit) {
      print("Withdrawal Limit has been rached for this month. Thank You!");
      return;
    }
    if (balance - amount < minBalance) {
      print("Minimum Balance \$500 must be maintained");
      return;
    }
    balance -= amount;
    _withdrawalsThisMonth++;
    print("Withdrew \$${amount.toStringAsFixed(2)}");
  }

  @override
  void deposit(double amount) {
    balance += amount;
    print("DEposited \$${amount.toStringAsFixed(2)}");
  }

  @override
  double calculateInterest() {
    return balance * 0.02; // 2% interest
  }
}
