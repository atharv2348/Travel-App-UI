import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension CustomAnimations on Widget {
  // Fade in and slide up animation
  Widget fadeInSlideUp({Duration delay = Duration.zero}) {
    return animate(delay: delay)
        .fadeIn(duration: 1000.ms, curve: Curves.easeOut)
        .slideY(begin: 0.5, end: 0, curve: Curves.easeOutQuint);
  }

  // Fade in and slide left animation
  Widget fadeInSlideLeft({Duration delay = Duration.zero}) {
    return animate(delay: delay)
        .fadeIn(duration: 1000.ms, curve: Curves.easeOut)
        .slideX(begin: 0.2, end: 0, curve: Curves.easeOutQuint);
  }

  // Fade in and slide left animation
  Widget fadeInSlideRight({Duration delay = Duration.zero}) {
    return animate(delay: delay)
        .fadeIn(duration: 1000.ms, curve: Curves.easeOut)
        .slideX(begin: -0.2, end: 0, curve: Curves.easeOutQuint);
  }

  // Scale bounce animation
  Widget scaleBounceAniation({Duration delay = Duration.zero}) {
    return animate(delay: delay)
        .fadeIn(duration: 800.ms, curve: Curves.elasticOut)
        .scale(
          duration: 1000.ms,
          curve: Curves.elasticOut,
          begin: const Offset(0.5, 0.5),
          end: const Offset(1, 1),
        );
  }
}
