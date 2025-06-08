import 'package:flutter/material.dart';

class AdvancedSimpleDialogScreen extends StatefulWidget {
  const AdvancedSimpleDialogScreen({super.key});

  @override
  State<AdvancedSimpleDialogScreen> createState() =>
      _AdvancedSimpleDialogScreenState();
}

class _AdvancedSimpleDialogScreenState
    extends State<AdvancedSimpleDialogScreen> {
  String _selectedOption = 'No option selected';

  // Dialog with Custom Widgets
  Future<void> _showCustomWidgetDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Custom Widgets Dialog'),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'john.doe@example.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context, {
                            'action': 'profile',
                            'user': 'John Doe'
                          });
                        },
                        icon: const Icon(Icons.person),
                        label: const Text('Profile'),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context, {
                            'action': 'settings',
                            'user': 'John Doe'
                          });
                        },
                        icon: const Icon(Icons.settings),
                        label: const Text('Settings'),
                      ),
                    ],
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
        _selectedOption = 'Action: ${result['action']} for ${result['user']}';
      });
    }
  }

  // Dialog with Form Input
  Future<void> _showFormDialog() async {
    final TextEditingController controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Enter Your Name'),
          contentPadding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 20),
            Row(
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
                    Navigator.pop(context, controller.text);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        );
      },
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _selectedOption = 'Hello, $result!';
      });
    }
  }

  // Dialog with Animation
  Future<void> _showAnimatedDialog() async {
    final result = await showGeneralDialog<String>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          ),
          child: SimpleDialog(
            title: const Text('Animated Dialog'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Animated Option 1');
                },
                child: const Text('Option 1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Animated Option 2');
                },
                child: const Text('Option 2'),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedOption = result;
      });
    }
  }

  // Dialog with Loading State
  Future<void> _showLoadingDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text('Loading...'),
                ],
              ),
            ),
          ],
        );
      },
    );

    // Simulate loading
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      Navigator.pop(context);
      setState(() {
        _selectedOption = 'Loading completed!';
      });
    }
  }

  // Dialog with Scrollable Content
  Future<void> _showScrollableDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Terms and Conditions'),
          children: [
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                        'nisi ut aliquip ex ea commodo consequat.\n\n'
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse '
                        'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat '
                        'cupidatat non proident, sunt in culpa qui officia deserunt mollit '
                        'anim id est laborum.\n\n'
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
                        'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa '
                        'quae ab illo inventore veritatis et quasi architecto beatae vitae '
                        'dicta sunt explicabo.',
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Declined');
                    },
                    child: const Text('Decline'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'Accepted');
                    },
                    child: const Text('Accept'),
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
        _selectedOption = 'Terms $result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced SimpleDialog Examples'),
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
                    'Custom Widget Dialog',
                    'Dialog with complex custom widgets',
                    _showCustomWidgetDialog,
                  ),
                  _buildExampleButton(
                    'Form Input Dialog',
                    'Dialog with text input field',
                    _showFormDialog,
                  ),
                  _buildExampleButton(
                    'Animated Dialog',
                    'Dialog with custom animation',
                    _showAnimatedDialog,
                  ),
                  _buildExampleButton(
                    'Loading Dialog',
                    'Non-dismissible loading indicator',
                    _showLoadingDialog,
                  ),
                  _buildExampleButton(
                    'Scrollable Dialog',
                    'Dialog with scrollable content',
                    _showScrollableDialog,
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
