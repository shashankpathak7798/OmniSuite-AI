import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/shader_effect.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/ticking_builder.dart';
import 'package:provider/provider.dart';

class SplashHeaderWidget extends StatelessWidget {
  const SplashHeaderWidget({super.key, this.showTagline = true, this.onTap, this.fontSize});

  final void Function()? onTap;
  final bool showTagline;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<FragmentPrograms?>(
        builder: (context, fragmentPrograms, child) {
          if (fragmentPrograms == null) {
            return const Center(child: CircularProgressIndicator());
          }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fragmentPrograms != null
                  ? TickingBuilder(
                builder: (context, time) => AnimatedSampler(
                      (image, size, canvas) {
                    const double overdrawPx = 30;
                    final shader = fragmentPrograms!.ui.fragmentShader();
                    shader
                      ..setFloat(0, size.width)
                      ..setFloat(1, size.height)
                      ..setFloat(2, time)
                      ..setImageSampler(0, image);
                    Rect rect = Rect.fromLTWH(-overdrawPx, -overdrawPx, size.width + overdrawPx, size.height + overdrawPx);
                    canvas.drawRect(rect, Paint()..shader = shader);
                  },
                  child: Transform.translate(
                    offset: const Offset(-(0.2 * .5), 0),
                    child: InkWell(
                      onTap: onTap,
                      child: Text(
                        "OmniSuite AI",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  : Transform.translate(
                offset: const Offset(-(0.2 * .5), 0),
                child: Text(
                  "OmniSuite AI",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Visibility(
                visible: !Responsive.isDesktop(context) && showTagline,
                child: _buildTagLineWidget(),
              )
            ],
          ),
        );
      }
    );
  }

  Widget _buildTagLineWidget() {
    return const Text(
      "Work Smarter, Not Harder—Welcome to OmniSuite AI",
      softWrap: true,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 18,
        fontStyle: FontStyle.italic,
        shadows: [Shadow(blurRadius: 2, color: Colors.black54, offset: Offset(1, 1))],
      ),
    );
  }
}
