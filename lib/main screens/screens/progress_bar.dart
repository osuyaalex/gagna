import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double currentValue;
  final double maxValue;
  final double progress;

  ProgressIndicatorWidget({Key? key, required this.currentValue, required this.maxValue, required this.progress}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: widget.progress).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant ProgressIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(begin: oldWidget.progress, end: widget.progress).animate(_controller);
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.39, // Adjust the width as needed
              height: 1, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.39 * _animation.value,
              height: 1,
              decoration: BoxDecoration(
                color: Color(0xff005E5E),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        );
      },
    );
  }
}
