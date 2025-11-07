import 'package:banking_system/bank_acc.dart';
import 'package:banking_system/interest_bearing.dart';

class SavingsAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 500;
  int _withdrawalsThisMonth = 0;
  static const int withdrawalLimit = 3;

  SavingsAccount({
    required int accountNumber,
    required String accountHolderName,
    required double balance,
  }) : super(
         accountNumber: accountNumber,
         accountHolderName: accountHolderName,
         balance: balance,
       ) {
    if (balance < minBalance) {
      throw Exception("Initial balance must be at least \$500");
    }
  }

  @override
  void deposit(double amount) {
    balance += amount;
    print("Deposited \$${amount.toStringAsFixed(2)}");
  }

  @override
  void withdraw(double amount) {
    if (_withdrawalsThisMonth >= withdrawalLimit) {
      print("Withdrawal limit reached for this month!");
      return;
    }
    if (balance - amount < minBalance) {
      print("Cannot withdraw. Minimum balance of \$500 must be maintained.");
      return;
    }
    balance -= amount;
    _withdrawalsThisMonth++;
    print("Withdrew \$${amount.toStringAsFixed(2)}");
  }

  @override
  double calculateInterest() {
    return balance * 0.02; // 2% interest
  }
}
