import 'package:flutter/material.dart';
import 'package:ticketmaster/ui/common/app_colors.dart';

/// Defines the type of button styling.
enum ButtonType { primary, secondary }

/// Defines the size variants for the button.
enum ButtonSize { large, normal, small }

/// A customizable button widget that supports primary and secondary types,
/// and different size variants. It applies different [ButtonStyle]s based on the
/// provided type and size.
class Button extends StatelessWidget {
  /// Callback invoked when the button is pressed.
  final VoidCallback? onPressed;

  /// Callback invoked on a long press.
  final VoidCallback? onLongPress;

  /// An optional style to further customize the button appearance.
  final ButtonStyle? style;

  /// The child widget displayed inside the button.
  final Widget? child;

  /// The button type determines the color scheme of the button.
  final ButtonType type;

  /// The button size determines the button's dimensions and text style.
  final ButtonSize size;

  /// Creates a [Button] widget.
  const Button({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.child,
    this.type = ButtonType.primary,
    this.size = ButtonSize.normal,
  });

  /// Returns the default style for primary buttons.
  static ButtonStyle get _primaryStyle {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(88, 48)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.backgroundDisabled;
        } else if (states.contains(WidgetState.pressed)) {
          return AppColors.accent;
        }
        return Colors.transparent;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.textDisabled;
        }
        return Colors.white;
      }),
    );
  }

  /// Returns the default style for secondary buttons.
  static ButtonStyle get _secondaryStyle {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(88, 48)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.secondaryDisabled;
        } else if (states.contains(WidgetState.pressed)) {
          return AppColors.secondaryPressed;
        }
        return AppColors.secondaryDefault;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.textDisabled;
        }
        return Colors.white;
      }),
    );
  }

  /// Returns a [ButtonStyle] based on the [ButtonSize].
  static ButtonStyle getSizeStyle(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 48)),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
        );
      case ButtonSize.normal:
        return ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(88, 48)),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14)),
        );
      case ButtonSize.small:
        return ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(60, 40)),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 12)),
        );
    }
  }

  /// Returns padding based on the button [ButtonSize].
  static EdgeInsets _contentPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
      case ButtonSize.normal:
        return const EdgeInsets.symmetric(horizontal: 36, vertical: 14);
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle baseStyle =
        (type == ButtonType.primary) ? _primaryStyle : _secondaryStyle;
    final ButtonStyle sizeStyle = getSizeStyle(size);
    ButtonStyle finalStyle = baseStyle.merge(sizeStyle);
    if (style != null) {
      finalStyle = finalStyle.merge(style);
    }

    final Widget elevatedButton = ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: finalStyle,
      child: Padding(
        padding: _contentPadding(size),
        child: child,
      ),
    );

    Widget buildButton() {
      if (type == ButtonType.primary) {
        return Stack(
          alignment: Alignment.center,
          fit: (size == ButtonSize.large ? StackFit.expand : StackFit.loose),
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: const BoxDecoration(color: AppColors.primary),
                ),
              ),
            ),
            elevatedButton,
          ],
        );
      } else {
        return elevatedButton;
      }
    }

    // For large buttons, enforce full-width.
    if (size == ButtonSize.large) {
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: buildButton(),
      );
    } else {
      return buildButton();
    }
  }
}
