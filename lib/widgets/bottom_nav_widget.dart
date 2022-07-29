import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: 58,
                margin: EdgeInsets.all(1),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: bottomNavYellow,
                      currentIndex: newIndex,
                      onTap: (index) {
                        indexChangeNotifier.value = index;
                      },
                      type: BottomNavigationBarType.fixed,
                      selectedFontSize: 12,
                      unselectedFontSize: 10,
                      selectedItemColor: Color.fromARGB(255, 14, 76, 149),
                      unselectedItemColor: Colors.grey,
                      elevation: 0,
                      selectedIconTheme: const IconThemeData(
                        color: Color.fromARGB(255, 14, 76, 149),
                      ),
                      unselectedIconTheme: const IconThemeData(
                        color: Colors.grey,
                      ),
                      items: const [
                        BottomNavigationBarItem(
                          label: "",
                          icon: Icon(
                            Icons.home,
                            size: 26,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "",
                          icon: Icon(
                            Icons.person,
                            size: 26,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "",
                          icon: Icon(
                            Icons.domain,
                            size: 26,
                          ),
                        ),
                        BottomNavigationBarItem(
                            label: "",
                            icon: Icon(
                              Icons.info,
                              size: 26,
                            )),
                        BottomNavigationBarItem(
                            label: "",
                            icon: Icon(
                              Icons.assignment,
                              size: 26,
                            )),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}

// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: indexChangeNotifier,
//         builder: (context, int newindex, _) {
//           return FloatingNavbar(
//               borderRadius: 18,
//               selectedBackgroundColor: Colors.yellow,
//               selectedItemColor: Color.fromARGB(255, 14, 76, 149),
//               unselectedItemColor: Colors.grey,
//               backgroundColor: Colors.yellow,
//               currentIndex: newindex,
//               onTap: (index) {
//                 print(index);
//                 indexChangeNotifier.value = index;
//               },
//               items: [
//                 FloatingNavbarItem(
//                   icon: Icons.home,
//                 ),
//                 FloatingNavbarItem(
//                   icon: Icons.person,
//                 ),
//                 FloatingNavbarItem(
//                   icon: Icons.domain,
//                 ),
//                 FloatingNavbarItem(icon: Icons.info),
//                 FloatingNavbarItem(icon: Icons.assignment),
//               ]);
//         });
//   }
// }
