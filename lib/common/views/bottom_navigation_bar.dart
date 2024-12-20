import 'package:baity_app/common/views/pages_wrapper.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}


class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.95),
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: getSize(20)),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: getSize(10)),
          indicator: const CircularTabBarIndicator(
            color: Colors.white,
            radius: 25,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          indicatorWeight: 0,
          tabs: const [
            Tab(icon: Icon(TablerIcons.home)),
            Tab(icon: Icon(TablerIcons.shopping_bag)),
            Tab(icon: Icon(TablerIcons.category_2)),
            Tab(icon: Icon(TablerIcons.heart)),
            Tab(icon: Icon(TablerIcons.user_circle)),
          ]
        ),
      ),
    );
  }
}

class CircularTabBarIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircularTabBarIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircularIndicatorPainter(color: color, radius: radius);
  }
}

class _CircularIndicatorPainter extends BoxPainter {
  final Color color;
  final double radius;

  _CircularIndicatorPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final circleOffset = Offset(
      offset.dx + configuration.size!.width / 2,
      offset.dy + configuration.size!.height - radius,
    );

    canvas.drawCircle(circleOffset, radius, paint);
  }
}