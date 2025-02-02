import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  State<ExpensesList> createState() => _ExpensesList();
}

class _ExpensesList extends State<ExpensesList> {
  double _iconOffset = 0.0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(widget.expenses[index]),
        onUpdate: (details) {
          setState(() {
            _iconOffset =
                details.progress * 100; // Adjust the multiplier as needed
          });
        },
        background: Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(3)),
          child: Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(_iconOffset, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  Text(
                    'Remove',
                    style: Theme.of(context).textTheme.copyWith().labelMedium
                  )
                ],
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          widget.onRemoveExpense(widget.expenses[index]);
        },
        child: ExpenseItem(expense: widget.expenses[index]),
      ),
    );
  }
}
