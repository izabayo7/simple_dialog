# Flutter SimpleDialog Widget Demo

This project demonstrates the comprehensive usage of Flutter's SimpleDialog widget for your class presentation.

## Project Structure

```
lib/
├── main.dart                    # Entry point of the application
├── screens/                     # All screen files
│   ├── home_screen.dart         # Main navigation screen
│   ├── basic_simple_dialog_screen.dart      # Basic examples
│   ├── styled_simple_dialog_screen.dart     # Styling examples
│   ├── advanced_simple_dialog_screen.dart   # Advanced features
│   └── practical_examples_screen.dart       # Real-world use cases
├── widgets/                     # Custom widgets
│   └── custom_simple_dialog.dart            # Custom dialog implementation
├── models/                      # Data models
│   └── user_model.dart         # User data model
└── utils/                      # Utility functions (ready for expansion)
```

## What is SimpleDialog?

SimpleDialog is a Material Design dialog that offers the user a choice between several options. It's perfect for:
- Presenting a list of options to choose from
- Creating simple selection menus
- Implementing quick action dialogs

## Key Features Demonstrated

### 1. Basic SimpleDialog
- Simple text options
- Options with icons
- Cancel option handling
- Long scrollable lists

### 2. Styled SimpleDialog
- Custom background colors
- Gradient backgrounds
- Custom padding (title, content, inset)
- Surface tint color (Material 3)
- Custom shapes and borders

### 3. Advanced SimpleDialog
- Custom widgets inside dialogs
- Form inputs with TextFields
- Animated dialogs
- Loading states
- Scrollable content
- Stateful dialogs with internal state

### 4. Practical Examples
- Language selection with flags
- User profile options
- Sort options with icons
- Share dialog with grid layout
- Filter options with switches
- Priority selection with colors

## SimpleDialog Properties

```dart
SimpleDialog(
  title: Widget?,                    // Dialog title
  titlePadding: EdgeInsetsGeometry,  // Padding around title
  titleTextStyle: TextStyle?,        // Style for title text
  children: List<Widget>?,           // Dialog content
  contentPadding: EdgeInsetsGeometry,// Padding around content
  backgroundColor: Color?,           // Background color
  elevation: double?,                // Shadow elevation
  shadowColor: Color?,               // Shadow color
  surfaceTintColor: Color?,          // Material 3 tint
  semanticLabel: String?,            // Accessibility label
  insetPadding: EdgeInsets?,         // Screen edge padding
  clipBehavior: Clip?,               // Content clipping
  shape: ShapeBorder?,               // Dialog shape
  alignment: AlignmentGeometry?,     // Dialog alignment
)
```

## Best Practices

1. **Always Handle Null Results**: Users can dismiss dialogs without selecting an option
   ```dart
   final result = await showDialog<String>(...);
   if (result != null) {
     // Handle selection
   }
   ```

2. **Use SimpleDialogOption**: For consistent Material Design styling
   ```dart
   SimpleDialogOption(
     onPressed: () { Navigator.pop(context, 'value'); },
     child: Text('Option'),
   )
   ```

3. **Return Values**: Use Navigator.pop() to return selected values
   ```dart
   Navigator.pop(context, selectedValue);
   ```

4. **Keep It Simple**: SimpleDialog is meant for simple choices. For complex forms, consider AlertDialog or custom dialogs.

## Running the Demo

1. Ensure Flutter is installed on your system
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Key Concepts for Presentation

### When to Use SimpleDialog
- When you need users to choose from a list of options
- For quick selection menus
- When options are mutually exclusive
- For simple, non-form based interactions

### When NOT to Use SimpleDialog
- For complex forms (use AlertDialog or custom dialogs)
- When you need action buttons at the bottom (use AlertDialog)
- For informational messages without choices (use AlertDialog)

### Accessibility
- SimpleDialog supports semantic labels for screen readers
- Proper focus management is built-in
- Dismissible by pressing escape or tapping outside

## Code Examples for Presentation

### Basic Example
```dart
Future<void> _showBasicDialog() async {
  final String? result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Choose an option'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, 'Option 1'); },
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () { Navigator.pop(context, 'Option 2'); },
            child: const Text('Option 2'),
          ),
        ],
      );
    },
  );
  
  // Handle result
  if (result != null) {
    print('Selected: $result');
  }
}
```

### Styled Example
```dart
SimpleDialog(
  backgroundColor: Colors.blue[50],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  title: const Text('Styled Dialog'),
  children: [...],
)
```

## Tips for Your Presentation

1. **Start with the basics**: Show a simple example first
2. **Build complexity gradually**: Move from basic to styled to advanced
3. **Show real-world use cases**: The practical examples demonstrate actual app scenarios
4. **Highlight differences**: Explain when to use SimpleDialog vs AlertDialog
5. **Interactive demo**: Let classmates interact with the different examples
6. **Code walkthrough**: Show the code structure and explain key concepts

## Additional Resources

- [Official Flutter Documentation](https://api.flutter.dev/flutter/material/SimpleDialog-class.html)
- [Material Design Guidelines](https://material.io/design/components/dialogs.html#simple-dialog)
- [Flutter Dialog Cookbook](https://flutter.dev/docs/cookbook/design/dialogs)

## Conclusion

SimpleDialog is a powerful yet simple widget for creating selection dialogs in Flutter. This demo showcases its flexibility and various use cases, from basic implementations to complex, styled versions suitable for production applications.
