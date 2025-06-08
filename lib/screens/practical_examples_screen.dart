import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/custom_simple_dialog.dart';

class PracticalExamplesScreen extends StatefulWidget {
  const PracticalExamplesScreen({super.key});

  @override
  State<PracticalExamplesScreen> createState() =>
      _PracticalExamplesScreenState();
}

class _PracticalExamplesScreenState extends State<PracticalExamplesScreen> {
  String _selectedOption = 'No action taken';

  // Language Selection Dialog
  Future<void> _showLanguageDialog() async {
    final languages = {
      'English': '🇺🇸',
      'Spanish': '🇪🇸',
      'French': '🇫🇷',
      'German': '🇩🇪',
      'Italian': '🇮🇹',
      'Portuguese': '🇵🇹',
      'Chinese': '🇨🇳',
      'Japanese': '🇯🇵',
    };

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Language'),
          children: languages.entries.map((entry) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, entry.key);
              },
              child: Row(
                children: [
                  Text(
                    entry.value,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 16),
                  Text(entry.key),
                ],
              ),
            );
          }).toList(),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Language changed to: $result';
      });
    }
  }

  // User Profile Options Dialog
  Future<void> _showUserProfileDialog() async {
    final user = UserModel(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      avatarUrl: 'https://example.com/avatar.jpg',
    );

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CustomSimpleDialog(
          user: user,
          onOptionSelected: (option) {
            Navigator.pop(context, option);
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'User action: $result';
      });
    }
  }

  // Sort Options Dialog
  Future<void> _showSortDialog() async {
    final sortOptions = [
      {'title': 'Name (A-Z)', 'icon': Icons.sort_by_alpha, 'value': 'name_asc'},
      {'title': 'Name (Z-A)', 'icon': Icons.sort_by_alpha, 'value': 'name_desc'},
      {'title': 'Date (Newest)', 'icon': Icons.calendar_today, 'value': 'date_desc'},
      {'title': 'Date (Oldest)', 'icon': Icons.calendar_today, 'value': 'date_asc'},
      {'title': 'Size (Largest)', 'icon': Icons.photo_size_select_large, 'value': 'size_desc'},
      {'title': 'Size (Smallest)', 'icon': Icons.photo_size_select_small, 'value': 'size_asc'},
    ];

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Sort By'),
          children: sortOptions.map((option) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, option['value'] as String);
              },
              child: Row(
                children: [
                  Icon(
                    option['icon'] as IconData,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 16),
                  Text(option['title'] as String),
                ],
              ),
            );
          }).toList(),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Sort by: $result';
      });
    }
  }

  // Share Options Dialog
  Future<void> _showShareDialog() async {
    final shareOptions = [
      {'title': 'Email', 'icon': Icons.email, 'color': Colors.red},
      {'title': 'WhatsApp', 'icon': Icons.chat, 'color': Colors.green},
      {'title': 'Facebook', 'icon': Icons.facebook, 'color': Colors.blue},
      {'title': 'Twitter', 'icon': Icons.share, 'color': Colors.lightBlue},
      {'title': 'Copy Link', 'icon': Icons.link, 'color': Colors.grey},
    ];

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Share via'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: shareOptions.map((option) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, option['title'] as String);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (option['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          option['icon'] as IconData,
                          color: option['color'] as Color,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        option['title'] as String,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }).toList(),
              ),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Shared via: $result';
      });
    }
  }

  // Filter Options Dialog
  Future<void> _showFilterDialog() async {
    Map<String, bool> filters = {
      'Show archived': false,
      'Show favorites': true,
      'Show shared': false,
      'Show private': true,
    };

    final result = await showDialog<Map<String, bool>>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: const Text('Filter Options'),
              children: [
                ...filters.entries.map((entry) {
                  return SwitchListTile(
                    title: Text(entry.key),
                    value: entry.value,
                    onChanged: (bool value) {
                      setState(() {
                        filters[entry.key] = value;
                      });
                    },
                  );
                }).toList(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, filters);
                        },
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      final activeFilters = result.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .join(', ');
      setState(() {
        _selectedOption = 'Active filters: $activeFilters';
      });
    }
  }

  // Priority Selection Dialog
  Future<void> _showPriorityDialog() async {
    final priorities = [
      {'label': 'High', 'color': Colors.red, 'icon': Icons.flag},
      {'label': 'Medium', 'color': Colors.orange, 'icon': Icons.flag},
      {'label': 'Low', 'color': Colors.green, 'icon': Icons.flag},
      {'label': 'None', 'color': Colors.grey, 'icon': Icons.flag_outlined},
    ];

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Set Priority'),
          children: priorities.map((priority) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, priority['label'] as String);
              },
              child: Row(
                children: [
                  Icon(
                    priority['icon'] as IconData,
                    color: priority['color'] as Color,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    priority['label'] as String,
                    style: TextStyle(
                      color: priority['color'] as Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Priority set to: $result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _selectedOption,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  _buildExampleButton(
                    'Language Selection',
                    'Select app language with flags',
                    _showLanguageDialog,
                  ),
                  _buildExampleButton(
                    'User Profile Options',
                    'Custom user profile dialog',
                    _showUserProfileDialog,
                  ),
                  _buildExampleButton(
                    'Sort Options',
                    'Sort list items with icons',
                    _showSortDialog,
                  ),
                  _buildExampleButton(
                    'Share Options',
                    'Grid layout share dialog',
                    _showShareDialog,
                  ),
                  _buildExampleButton(
                    'Filter Options',
                    'Toggle filters with switches',
                    _showFilterDialog,
                  ),
                  _buildExampleButton(
                    'Priority Selection',
                    'Set task priority with colors',
                    _showPriorityDialog,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleButton(
    String title,
    String description,
    VoidCallback onPressed,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: const Text('Show'),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
