import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/distribution_representative_model.dart';

class CustomDropdown extends StatefulWidget {
  final List<DistributionRepresentativeModel> items;
  final DistributionRepresentativeModel? selectedItem;
  final void Function(DistributionRepresentativeModel?)? onChanged;
  final String hint;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  DistributionRepresentativeModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DistributionRepresentativeModel>(
      hint: Text(widget.hint),
      value: _selectedItem,
      onChanged: (DistributionRepresentativeModel? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      items: widget.items.map((DistributionRepresentativeModel item) {
        return DropdownMenuItem<DistributionRepresentativeModel>(
          value: item,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.fullName ?? "Unknown"),
                if (_selectedItem != item) // Condition to show/hide the avatar
                  CircleAvatar(
                    radius: 15, // Adjust the radius as needed
                    backgroundImage: item.pic != null
                        ? CachedNetworkImageProvider(
                            'https://zilzal.pythonanywhere.com${item.pic!}')
                        : null,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
