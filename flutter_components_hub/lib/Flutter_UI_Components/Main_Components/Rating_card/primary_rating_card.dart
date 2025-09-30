import 'package:flutter/material.dart';

/// A complete, self-contained app rating prompt widget.
///
/// This widget displays a card with a title, a set of interactive stars,
/// and a 'Confirm' button. The user can set a rating by tapping or dragging
/// the stars. Tapping outside the card will dismiss the prompt and reset the rating.
class AppRatingPrompt extends StatefulWidget {
  const AppRatingPrompt({
    super.key,
    this.title = 'Enjoying our app...\n         Rate us',
    this.starCount = 5,
    this.starSize = 40.0,
    this.color = Colors.amber,
    this.borderColor = Colors.grey,
    this.buttonText = 'Confirm',
    required this.onRatingConfirmed,
  });

  /// The title text to display at the top of the card.
  final String title;

  /// The total number of stars to display.
  final int starCount;

  /// The size of each star icon.
  final double starSize;

  /// The color of the filled stars.
  final Color color;

  /// The color of the star borders (empty stars).
  final Color borderColor;

  /// The text for the confirmation button.
  final String buttonText;

  /// Callback function that is called when the user confirms their rating.
  final ValueChanged<double> onRatingConfirmed;

  @override
  State<AppRatingPrompt> createState() => _AppRatingPromptState();
}

class _AppRatingPromptState extends State<AppRatingPrompt>
    with SingleTickerProviderStateMixin {
  // Use a ValueNotifier to manage the rating state efficiently.
  late ValueNotifier<double> _ratingNotifier;
  final GlobalKey _starRowKey = GlobalKey();

  // Animation for the button
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _ratingNotifier = ValueNotifier<double>(0.0);

    // Initialize the animation controller and animation for the button
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
    );

    _buttonScaleAnimation = Tween(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _ratingNotifier.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  /// Calculates the rating based on the gesture's horizontal position.
  double _getRatingFromGesture(double dx) {
    final RenderBox renderBox =
        _starRowKey.currentContext!.findRenderObject() as RenderBox;
    final double rating = (dx / (renderBox.size.width / widget.starCount))
        .clamp(0.0, widget.starCount.toDouble());
    return rating;
  }

  /// Handles a single tap and sets the rating to a whole number.
  void _handleTap(double dx) {
    final double rating = (_getRatingFromGesture(
      dx,
    )).roundToDouble().clamp(0.0, widget.starCount.toDouble());
    _ratingNotifier.value = rating;
  }

  /// Updates the rating in real-time. This is for dragging.
  void _updateRating(double dx) {
    final newRating = _getRatingFromGesture(dx);
    _ratingNotifier.value = newRating;
  }

  /// Builds a single star with a fractional fill.
  Widget _buildStar(int starIndex) {
    final double starRating = _ratingNotifier.value;
    final double fillPercentage = (starRating - starIndex).clamp(0.0, 1.0);

    return SizedBox(
      width: widget.starSize,
      height: widget.starSize,
      child: Stack(
        children: [
          // Background star (unfilled or border)
          Icon(Icons.star, size: widget.starSize, color: widget.borderColor),
          // Filled star (with a ClipRect to show a fractional portion)
          ClipRect(
            clipper: StarClipper(percentage: fillPercentage),
            child: Icon(Icons.star, size: widget.starSize, color: widget.color),
          ),
        ],
      ),
    );
  }

  /// Handles the button tap down animation.
  void _onButtonTapDown(TapDownDetails details) {
    _buttonAnimationController.forward();
  }

  /// Handles the button tap up animation and action.
  void _onButtonTapUp(TapUpDetails details) {
    _buttonAnimationController.reverse();
    widget.onRatingConfirmed(_ratingNotifier.value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tapping on the transparent space dismisses the widget.
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.black.withValues(alpha: 0.5), // Semi-transparent overlay
        child: Center(
          child: GestureDetector(
            // Tapping on the card itself does not dismiss the dialog.
            onTap: () {},
            child: SizedBox(
              width: 250,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTapUp: (details) =>
                            _handleTap(details.localPosition.dx),
                        onPanUpdate: (details) =>
                            _updateRating(details.localPosition.dx),
                        child: ValueListenableBuilder<double>(
                          valueListenable: _ratingNotifier,
                          builder: (context, rating, child) {
                            return Row(
                              key: _starRowKey,
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                widget.starCount,
                                (index) => _buildStar(index),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ScaleTransition(
                            scale: _buttonScaleAnimation,
                            child: GestureDetector(
                              onTapDown: _onButtonTapDown,
                              onTapUp: _onButtonTapUp,
                              child: TextButton(
                                onPressed: () {}, // Handled by GestureDetector
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                child: Text(
                                  widget.buttonText,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A custom clipper for creating the fractional star fill effect.
class StarClipper extends CustomClipper<Rect> {
  final double percentage;

  StarClipper({required this.percentage});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width * percentage, size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {
    return oldClipper.percentage != percentage;
  }
}

// Usages
//  ElevatedButton(
//               onPressed: () {
//                 // Call showDialog to display the custom rating prompt widget.
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AppRatingPrompt(
//                       // This callback will be triggered when the user confirms their rating.
//                       onRatingConfirmed: (rating) {
//                         setState(() {
//                           _lastConfirmedRating = rating;
//                         });
//                         // You can perform an action here, like sending the rating to a server.
//                         print('User confirmed rating: $rating');
//                       },
//                     );
//                   },
//                 );
//               },)
