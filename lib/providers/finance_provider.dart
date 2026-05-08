import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

/// [FinanceProvider] handles the state of user finances, including
/// transactions, total balances, and budgets.
class FinanceProvider extends ChangeNotifier {
  // A mock initial total balance
  double _initialBalance = 100000.0;
  
  // A mock monthly budget allocated
  double _monthlyBudget = 50000.0;

  // In-memory list of all transactions
  final List<TransactionModel> _transactions = [];

  /// Returns a copy of all transactions sorted by date (newest first).
  List<TransactionModel> get transactions {
    final sorted = List<TransactionModel>.from(_transactions);
    sorted.sort((a, b) => b.date.compareTo(a.date));
    return sorted;
  }

  /// Calculates the total amount spent (sum of all expenses).
  double get totalSpent {
    return _transactions
        .where((t) => t.isExpense)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  /// Calculates the current available balance.
  double get currentBalance {
    return _initialBalance - totalSpent;
  }

  /// Calculates the remaining budget.
  double get budgetLeft {
    return _monthlyBudget - totalSpent;
  }
  
  /// Gets the total budget.
  double get totalBudget => _monthlyBudget;

  /// Groups expenses by category and returns the sum for each.
  Map<String, double> get expensesByCategory {
    final Map<String, double> categorySums = {
      'Food': 0.0,
      'Travel': 0.0,
      'Shopping': 0.0,
      'Bills': 0.0,
      'Other': 0.0,
    };

    for (var t in _transactions) {
      if (t.isExpense) {
        if (categorySums.containsKey(t.category)) {
          categorySums[t.category] = categorySums[t.category]! + t.amount;
        } else {
          categorySums['Other'] = categorySums['Other']! + t.amount;
        }
      }
    }
    return categorySums;
  }

  /// Adds a new expense to the state and notifies listeners.
  void addExpense({
    required String userId,
    required double amount,
    required String category,
    required String description,
  }) {
    final newTx = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      amount: amount,
      title: description,
      category: category,
      date: DateTime.now(),
      isExpense: true,
    );
    _transactions.add(newTx);
    notifyListeners();
  }

  /// Updates an existing transaction.
  void editTransaction(TransactionModel updatedTx) {
    final index = _transactions.indexWhere((t) => t.id == updatedTx.id);
    if (index >= 0) {
      _transactions[index] = updatedTx;
      notifyListeners();
    }
  }

  /// Deletes a transaction by its ID.
  void deleteTransaction(String transactionId) {
    _transactions.removeWhere((t) => t.id == transactionId);
    notifyListeners();
  }
}
