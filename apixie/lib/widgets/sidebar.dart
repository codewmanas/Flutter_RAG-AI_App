import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widgets/sidebar_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 64 : 150 ,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: Colors.white,
            size: isCollapsed ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                
                const SizedBox(height: 24),
                SideBarButton(
                  isCollapsed: isCollapsed,
                   icon: Icons.add,
                    text: "Home"
                    ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                   icon: Icons.search,
                    text: "Search"
                    ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                   icon: Icons.language,
                    text: "Spaces"
                    ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                   icon: Icons.auto_awesome,
                    text: "Discover"
                    ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                   icon: Icons.cloud_outlined,
                    text: "Library"
                    ),
                const Spacer(),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
          GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    child: Icon(
                      isCollapsed? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                      color: AppColors.iconGrey,
                      size: 22,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
