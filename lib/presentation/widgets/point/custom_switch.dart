import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _setAnimation();
    super.initState();
  }

  void _setAnimation() {
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onTap() {
    widget.onChanged(!widget.value);
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, _) {
          return Container(
            width: 49.0,
            height: 26.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color.lerp(
                Colors.grey[300],
                widget.activeColor,
                _animation.value,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: _animation.value * 20.0,
                right: (1 - _animation.value) * 20.0,
              ),
              child: Center(
                child: Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
