import 'package:flutter/material.dart';

/// A customizable alert dialog with a smooth scale and fade-in animation.
///
/// This widget provides a sleek, reusable alert dialog with a main text area
/// and two text buttons for user interaction.
class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancelButtonText = 'Cancel',
    this.confirmButtonText = 'Confirm',
    required this.onConfirm,
    this.onCancel,
  });

  /// The title text of the dialog.
  final String title;

  /// The main content text of the dialog.
  final String content;

  /// The text for the cancel button. Defaults to 'Cancel'.
  final String cancelButtonText;

  /// The text for the confirm button. Defaults to 'Confirm'.
  final String confirmButtonText;

  /// The callback function for the confirm button.
  final VoidCallback onConfirm;

  /// The optional callback function for the cancel button.
  final VoidCallback? onCancel;

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start the animation when the widget is first built.
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Content
                    Text(
                      widget.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              // Horizontal Line
              const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
              // Buttons
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.onCancel?.call();
                        },
                        child: Text(
                          widget.cancelButtonText,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Vertical Separator
                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Color(0xFFE0E0E0),
                    ),
                    // Confirm Button
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.onConfirm();
                        },
                        child: Text(
                          widget.confirmButtonText,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
