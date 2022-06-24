import 'package:flutter/material.dart';
import 'package:test_to_do/config/theme/styles.dart';
import 'package:test_to_do/domain/entities/task_filter.dart';

import 'appbar_filter_button.dart';

class AppBarFilter extends StatefulWidget {
  final TaskFilter filter;
  final Function(TaskFilter) onChange;
  const AppBarFilter({required this.filter, required this.onChange, Key? key})
      : super(key: key);

  @override
  State<AppBarFilter> createState() => _AppBarFilterState();
}

class _AppBarFilterState extends State<AppBarFilter> {
  late TaskFilter selectedFilter;

  void select(TaskFilter filter) {
    widget.onChange(filter);
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  void initState() {
    selectedFilter = widget.filter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarFiltersButton(
            selected: selectedFilter == TaskFilter.all,
            onTap: () => select(TaskFilter.all),
            child: Text(
              'Усі',
              style: textRegular18,
            )),
        const SizedBox(
          width: 10,
        ),
        AppBarFiltersButton(
            selected: selectedFilter == TaskFilter.working,
            onTap: () => select(TaskFilter.working),
            child: Text(
              'Робочі',
              style: textRegular18,
            )),
        const SizedBox(
          width: 10,
        ),
        AppBarFiltersButton(
            selected: selectedFilter == TaskFilter.personal,
            onTap: () => select(TaskFilter.personal),
            child: Text(
              'Особисті',
              style: textRegular18,
            )),
      ],
    );
  }
}
