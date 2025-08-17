import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosStyleTextField extends StatefulWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? prefixIcon;

  const IosStyleTextField({
    super.key,
    required this.placeholder,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _IosStyleTextFieldState createState() => _IosStyleTextFieldState();
}

class _IosStyleTextFieldState extends State<IosStyleTextField> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;
  bool _isFocused = false;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _textEditingController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onTextChange() {
    setState(() {
      _showClearButton = _textEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: _isFocused
            ? CupertinoColors.extraLightBackgroundGray
            : CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(17.0),
        border: _isFocused
            ? Border.all(color: CupertinoColors.activeBlue, width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          if (widget.prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                widget.prefixIcon,
                color: _isFocused
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.systemGrey,
              ),
            ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.placeholder,
                hintStyle: const TextStyle(
                  color: CupertinoColors.placeholderText,
                ),
              ),
            ),
          ),
          if (_showClearButton)
            GestureDetector(
              onTap: () {
                _textEditingController.clear();
              },
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: CupertinoColors.systemGrey,
              ),
            ),
        ],
      ),
    );
  }
}
