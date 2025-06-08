import 'package:flutter/material.dart';

class StyledSimpleDialogScreen extends StatefulWidget {
  const StyledSimpleDialogScreen({super.key});

  @override
  State<StyledSimpleDialogScreen> createState() =>
      _StyledSimpleDialogScreenState();
}

class _StyledSimpleDialogScreenState extends State<StyledSimpleDialogScreen> {
  String _selectedOption = 'No option selected';

  // Custom Styled SimpleDialog
  Future<void> _showCustomStyledDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.blueGrey[50],
          elevation: 10,
          shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Custom Styled Dialog',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          titlePadding: const EdgeInsets.all(24),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Styled Option 1');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Styled Option 1',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Divider(),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Styled Option 2');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Styled Option 2',
                  style: TextStyle(fontSize: 16),
                ),
              ),
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

  // Gradient Background Dialog
  Future<void> _showGradientBackgroundDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Gradient Dialog',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'Gradient Option 1');
                    },
                    child: const Text(
                      'Option 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'Gradient Option 2');
                    },
                    child: const Text(
                      'Option 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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

  // Dialog with Custom Padding
  Future<void> _showCustomPaddingDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Custom Padding Dialog'),
          titlePadding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 100,
          ),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[200],
              child: const Text(
                'This dialog has custom padding values for title, content, and inset.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Custom Padding Option');
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Select This Option',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
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

  // Dialog with Surface Tint
  Future<void> _showSurfaceTintDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          surfaceTintColor: Colors.amber,
          elevation: 8,
          title: const Text('Surface Tint Dialog'),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'This dialog uses surfaceTintColor for Material 3 theming',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Tinted Option 1');
              },
              child: const Text('Option with Surface Tint 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Tinted Option 2');
              },
              child: const Text('Option with Surface Tint 2'),
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

  // Dialog with Custom Shape
  Future<void> _showCustomShapeDialog() async {
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          title: const Text('Custom Shape Dialog'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Custom Shape Option 1');
              },
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Custom Shape Option 2');
              },
              child: const Text('Option 2'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled SimpleDialog Examples'),
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
                    'Custom Styled Dialog',
                    'Background color, elevation, shadow, and shape',
                    _showCustomStyledDialog,
                  ),
                  _buildExampleButton(
                    'Gradient Background',
                    'Dialog with gradient background',
                    _showGradientBackgroundDialog,
                  ),
                  _buildExampleButton(
                    'Custom Padding',
                    'Custom title, content, and inset padding',
                    _showCustomPaddingDialog,
                  ),
                  _buildExampleButton(
                    'Surface Tint Color',
                    'Material 3 surface tint overlay',
                    _showSurfaceTintDialog,
                  ),
                  _buildExampleButton(
                    'Custom Shape',
                    'Dialog with custom border radius',
                    _showCustomShapeDialog,
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
