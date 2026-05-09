import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/finance_provider.dart';
import '../models/transaction_model.dart';

/// [BudgetScreen] displays the user's category-wise budget usage
/// and lists all transactions with options to edit or delete them.
class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final financeProvider = Provider.of<FinanceProvider>(context);
    final transactions = financeProvider.transactions;
    final formatter = NumberFormat("#,##0", "en_US");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Budget & Expenses',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'بجٹ اور اخراجات',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Jameel Noori Nastaleeq',
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Overall Budget Header
            Container(
              padding: const EdgeInsets.all(24.0),
              color: const Color(0xFFF8FAFC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Budget',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'PKR ${formatter.format(financeProvider.totalBudget)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Budget Left',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'PKR ${formatter.format(financeProvider.budgetLeft)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: financeProvider.budgetLeft < 0
                              ? Colors.red
                              : const Color(0xFF00BFA5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Transactions List
            Expanded(
              child: transactions.isEmpty
                  ? const Center(
                      child: Text(
                        'No expenses recorded yet.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        return _buildTransactionItem(
                          context,
                          tx,
                          financeProvider,
                          formatter,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    TransactionModel tx,
    FinanceProvider provider,
    NumberFormat formatter,
  ) {
    IconData categoryIcon = Icons.category;
    Color iconColor = Colors.grey;

    switch (tx.category) {
      case 'Food':
        categoryIcon = Icons.fastfood;
        iconColor = Colors.orange;
        break;
      case 'Travel':
        categoryIcon = Icons.directions_car;
        iconColor = Colors.blue;
        break;
      case 'Shopping':
        categoryIcon = Icons.shopping_bag;
        iconColor = Colors.redAccent;
        break;
      case 'Bills':
        categoryIcon = Icons.receipt;
        iconColor = Colors.purple;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: iconColor.withAlpha((255 * 0.1).toInt()),
          child: Icon(categoryIcon, color: iconColor),
        ),
        title: Text(
          tx.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${tx.category} • ${DateFormat.yMMMd().format(tx.date)}',
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '-PKR ${formatter.format(tx.amount)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _showEditDialog(context, tx, provider);
                } else if (value == 'delete') {
                  provider.deleteTransaction(tx.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Expense deleted')),
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    TransactionModel tx,
    FinanceProvider provider,
  ) {
    final amountController = TextEditingController(text: tx.amount.toString());
    final titleController = TextEditingController(text: tx.title);
    String selectedCategory = tx.category;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Expense'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount (PKR)',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ✅ FIXED HERE
                    DropdownButtonFormField<String>(
                      value:
                          [
                            'Food',
                            'Travel',
                            'Shopping',
                            'Bills',
                            'Other',
                          ].contains(selectedCategory)
                          ? selectedCategory
                          : 'Other',
                      items: ['Food', 'Travel', 'Shopping', 'Bills', 'Other']
                          .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            selectedCategory = val;
                          });
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Category'),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final newAmount =
                        double.tryParse(amountController.text) ?? tx.amount;
                    final updatedTx = tx.copyWith(
                      amount: newAmount,
                      category: selectedCategory,
                      title: titleController.text,
                    );
                    provider.editTransaction(updatedTx);
                    Navigator.pop(ctx);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
