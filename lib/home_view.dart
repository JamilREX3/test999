import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {


  // void _onDragStart(DragStartDetails details){
  //   bool isDragOpenFromLeft = animationController.isDismissed && details.globalPosition.dx < min
  // }






  double maxSlide = 225.0;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 250));
  }

  void toggleDrawer()=>animationController!.isDismissed?animationController!.forward():animationController!.reverse();


  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GestureDetector(
      // onHorizontalDragStart: _onDragStart,
      // onHorizontalDragUpdate: _onDragUpdate,
      // onHorizontalDragEnd: _onDragEnd,





      onTap: toggleDrawer,
      child: AnimatedBuilder(animation: animationController!, builder: (context,_){

        double slide = maxSlide * animationController!.value;
        double scale = 1 - (animationController!.value * 0.3);

        return Stack(
          children: [
            Container(
              color: Colors.blue,
            ),
            Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.yellow,
                ))
          ],
        );
      }),
    );
  }
}
