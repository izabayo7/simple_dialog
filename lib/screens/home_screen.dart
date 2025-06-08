import 'package:flutter/material.dart';
import 'basic_simple_dialog_screen.dart';
import 'styled_simple_dialog_screen.dart';
import 'advanced_simple_dialog_screen.dart';
import 'practical_examples_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialog Widget Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Flutter SimpleDialog Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'The SimpleDialog widget is a Material Design dialog that offers the user a choice between several options. Explore different implementations below:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildExampleCard(
              context,
              'Basic SimpleDialog',
              'Learn the fundamentals of SimpleDialog widget',
              Icons.widgets_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasicSimpleDialogScreen(),
                ),
              ),
            ),
            _buildExampleCard(
              context,
              'Styled SimpleDialog',
              'Explore customization options and styling',
              Icons.palette_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StyledSimpleDialogScreen(),
                ),
              ),
            ),
            _buildExampleCard(
              context,
              'Advanced SimpleDialog',
              'Complex interactions and advanced features',
              Icons.settings_applications_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdvancedSimpleDialogScreen(),
                ),
              ),
            ),
            _buildExampleCard(
              context,
              'Practical Examples',
              'Real-world use cases and implementations',
              Icons.business_center_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PracticalExamplesScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
      ),
    );
  }
}
