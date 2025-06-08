# SimpleDialog Quick Reference

## Basic SimpleDialog Template

```dart
Future<void> _showSimpleDialog() async {
  final String? result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Dialog Title'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'option1');
            },
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'option2');
            },
            child: const Text('Option 2'),
          ),
        ],
      );
    },
  );

  // Handle the result
  if (result != null) {
    print('Selected: $result');
  }
}
```

## All SimpleDialog Properties

```dart
SimpleDialog(
  key: Key?,                         // Widget key
  title: Widget?,                    // Title widget (usually Text)
  titlePadding: EdgeInsetsGeometry,  // Default: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0)
  titleTextStyle: TextStyle?,        // Style for title if it's a Text widget
  children: List<Widget>?,           // List of options (usually SimpleDialogOption)
  contentPadding: EdgeInsetsGeometry,// Default: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0)
  backgroundColor: Color?,           // Dialog background color
  elevation: double?,                // Shadow elevation
  shadowColor: Color?,               // Shadow color
  surfaceTintColor: Color?,          // Material 3 surface tint
  semanticLabel: String?,            // For accessibility
  insetPadding: EdgeInsets?,         // Minimum space between dialog and screen edges
  clipBehavior: Clip?,               // How to clip the content
  shape: ShapeBorder?,               // Dialog shape (e.g., rounded corners)
  alignment: AlignmentGeometry?,     // How to align the dialog
)
```

## Common Patterns

### With Icons
```dart
SimpleDialogOption(
  onPressed: () { Navigator.pop(context, 'apple'); },
  child: const Row(
    children: [
      Icon(Icons.apple, color: Colors.red),
      SizedBox(width: 16),
      Text('Apple'),
    ],
  ),
)
```

### Custom Styling
```dart
SimpleDialog(
  backgroundColor: Colors.blue[50],
  elevation: 10,
  shadowColor: Colors.blue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  title: const Text('Styled Dialog'),
  children: [...],
)
```

### With Custom Widget
```dart
SimpleDialog(
  title: const Text('Custom Content'),
  children: [
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(radius: 40),
          SizedBox(height: 10),
          Text('Custom Widget'),
          ElevatedButton(
            onPressed: () { Navigator.pop(context); },
            child: Text('Close'),
          ),
        ],
      ),
    ),
  ],
)
```

### Handling Different Return Types
```dart
// Returning an enum
enum Department { treasury, state }

final Department? result = await showDialog<Department>(...);

// Returning a map
final Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(...);

// Returning a custom object
final UserAction? result = await showDialog<UserAction>(...);
```

## showDialog Parameters

```dart
showDialog<T>(
  context: BuildContext,              // Required
  builder: (BuildContext) => Widget,  // Required - returns the dialog
  barrierDismissible: bool,          // Default: true - tap outside to dismiss
  barrierColor: Color?,              // Default: Colors.black54
  barrierLabel: String?,             // For accessibility
  useSafeArea: bool,                 // Default: true
  useRootNavigator: bool,            // Default: true
  routeSettings: RouteSettings?,     // For navigation
  anchorPoint: Offset?,              // Where to anchor the dialog
)
```

## Material Design Guidelines

- **Title**: Should clearly indicate the choice being presented
- **Options**: Should be concise and clearly distinguishable
- **Order**: Most likely option first, destructive actions last
- **Count**: Ideally 2-5 options, use a different pattern for more

## Common Mistakes to Avoid

1. **Not handling null results**
```dart
// ❌ Wrong
final result = await showDialog(...);
doSomething(result); // Crashes if user dismisses

// ✅ Correct
final result = await showDialog(...);
if (result != null) {
  doSomething(result);
}
```

2. **Using setState inside dialog builder**
```dart
// ❌ Wrong - won't update dialog
SimpleDialog(
  children: [
    ElevatedButton(
      onPressed: () {
        setState(() { /* This won't work */ });
      },
    ),
  ],
)

// ✅ Correct - use StatefulBuilder
StatefulBuilder(
  builder: (context, setState) {
    return SimpleDialog(...);
  },
)
```

3. **Forgetting to pop with value**
```dart
// ❌ Wrong - returns null
onPressed: () {
  Navigator.pop(context);
}

// ✅ Correct - returns value
onPressed: () {
  Navigator.pop(context, 'selectedValue');
}
```

## Comparison with AlertDialog

| Feature | SimpleDialog | AlertDialog |
|---------|-------------|-------------|
| Purpose | List of options | Information + actions |
| Layout | Vertical list | Content + button row |
| Buttons | Each option is clickable | Separate action buttons |
| Best for | Selection menus | Confirmations, warnings |
| Return value | Any type via Navigator.pop | Usually from button callbacks |
