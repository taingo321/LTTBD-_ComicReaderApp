import 'package:flutter/material.dart';
import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String selectedFilter = 'Tuần';

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      width: 230,
      height: 50,
      margin: EdgeInsets.only(left: 170, bottom: 12),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilterButton(
            title: 'Tuần',
            isSelected: selectedFilter == 'Tuần',
            onPressed: () => _onFilterSelected('Tuần'),
          ),
          const SizedBox(width: 10),
          FilterButton(
            title: 'Tháng',
            isSelected: selectedFilter == 'Tháng',
            onPressed: () => _onFilterSelected('Tháng'),
          ),
          const SizedBox(width: 10),
          FilterButton(
            title: 'Năm',
            isSelected: selectedFilter == 'Năm',
            onPressed: () => _onFilterSelected('Năm'),
          ),
        ],
      ),
    );
  }
}
