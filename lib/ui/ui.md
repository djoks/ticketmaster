# ui/

Holds all user interface elements.

- **common/**: Common themes, colors, styling or helpers used across multiple views.
- **layouts/**: Shared layouts used across multiple views.
- **views/**: Individual pages or screens. Each page can be in its own sub-folder and typically contains:
  - `example_view.dart`
  - `example_view_model.dart` (For MVVM)
  - An optional `widgets/` folder if there are widgets unique to that specific page.
- **widgets/**: Global widgets shared across multiple screens.
