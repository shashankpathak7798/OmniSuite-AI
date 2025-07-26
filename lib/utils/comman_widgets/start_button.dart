import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

class StartBtn extends StatefulWidget {
  const StartBtn({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<StartBtn> createState() => _StartBtnState();
}

class _StartBtnState extends State<StartBtn> {
  AnimationController? _btnAnim;
  bool _wasHovered = false;

  @override
  Widget build(BuildContext context) {
    return FocusableControlBuilder(
      cursor: SystemMouseCursors.click,
      onPressed: widget.onPressed,
      builder: (_, state) {
        if ((state.isHovered || state.isFocused) && !_wasHovered && _btnAnim?.status != AnimationStatus.forward) {
          _btnAnim?.forward(from: 0);
        }
        _wasHovered = (state.isHovered || state.isFocused);
        return SizedBox(
          width: 300,
          height: 70,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset("assets/images/button-start.png"),
              ),
              if (state.isHovered || state.isFocused) ...[
                Positioned.fill(
                  child: Image.asset("assets/images/button-start-hover.png"),
                ),
              ],
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).animate(autoPlay: false, onInit: (c) => _btnAnim = c).shimmer(duration: .7.seconds, color: Colors.black),
        ).animate().fadeIn(delay: 1.2.seconds).slide(
              begin: const Offset(0, .2),
            );
      },
    );
  }
}
