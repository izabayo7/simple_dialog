import 'package:flutter/material.dart';

class BasicSimpleDialogScreen extends StatefulWidget {
  const BasicSimpleDialogScreen({super.key});

  @override
  State<BasicSimpleDialogScreen> createState() =>
      _BasicSimpleDialogScreenState();
}

class _BasicSimpleDialogScreenState extends State<BasicSimpleDialogScreen> {
  String _selectedOption = 'No option selected';

  // Basic SimpleDialog
  Future<void> _showBasicSimpleDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select an option'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Option 1');
              },
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Option 2');
              },
              child: const Text('Option 2'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Option 3');
              },
              child: const Text('Option 3'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = result;
      });
    }
  }

  // SimpleDialog with Icons
  Future<void> _showSimpleDialogWithIcons() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose your favorite fruit'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Apple');
              },
              child: const Row(
                children: [
                  Icon(Icons.apple, color: Colors.red),
                  SizedBox(width: 16),
                  Text('Apple'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Banana');
              },
              child: const Row(
                children: [
                  Icon(Icons.breakfast_dining, color: Colors.yellow),
                  SizedBox(width: 16),
                  Text('Banana'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Orange');
              },
              child: const Row(
                children: [
                  Icon(Icons.circle, color: Colors.orange),
                  SizedBox(width: 16),
                  Text('Orange'),
                ],
              ),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Selected fruit: $result';
      });
    }
  }

  // SimpleDialog with Cancel Option
  Future<void> _showSimpleDialogWithCancel() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Confirm Action'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Delete');
              },
              child: const Text(
                'Delete Item',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Archive');
              },
              child: const Text('Archive Item'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Action: $result';
      });
    } else {
      setState(() {
        _selectedOption = 'Dialog dismissed';
      });
    }
  }

  // SimpleDialog with Long List
  Future<void> _showSimpleDialogWithLongList() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select a country'),
          children: <Widget>[
            for (String country in [
              'United States',
              'Canada',
              'United Kingdom',
              'Germany',
              'France',
              'Japan',
              'Australia',
              'Brazil',
              'India',
              'China'
            ])
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, country);
                },
                child: Text(country),
              ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = 'Selected country: $result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic SimpleDialog Examples'),
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
                    'Basic SimpleDialog',
                    'Shows a simple dialog with text options',
                    _showBasicSimpleDialog,
                  ),
                  _buildExampleButton(
                    'SimpleDialog with Icons',
                    'Shows options with icons for better UX',
                    _showSimpleDialogWithIcons,
                  ),
                  _buildExampleButton(
                    'SimpleDialog with Cancel',
                    'Includes a cancel option and handles dismissal',
                    _showSimpleDialogWithCancel,
                  ),
                  _buildExampleButton(
                    'SimpleDialog with Long List',
                    'Shows a scrollable list of options',
                    _showSimpleDialogWithLongList,
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
