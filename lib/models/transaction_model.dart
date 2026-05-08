import 'package:flutter/material.dart';

/// [TransactionModel] represents a single expense or income entry.
class TransactionModel {
  /// Unique identifier for the transaction
  final String id;
  
  /// The ID of the user who created this transaction
  final String userId;

  /// The amount of the transaction
  final double amount;

  /// A short description of the transaction
  final String title;

  /// The category it belongs to (e.g., Food, Travel, Shopping, Bills)
  final String category;

  /// The date when the transaction occurred
  final DateTime date;

  /// True if this is an expense, false if it's an income (default true for this module)
  final bool isExpense;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.title,
    required this.category,
    required this.date,
    this.isExpense = true,
  });

  /// Creates a copy of the current [TransactionModel] with updated fields.
  TransactionModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? title,
    String? category,
    DateTime? date,
    bool? isExpense,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      title: title ?? this.title,
      category: category ?? this.category,
      date: date ?? this.date,
      isExpense: isExpense ?? this.isExpense,
    );
  }
}
