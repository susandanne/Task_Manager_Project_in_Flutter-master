import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../utilitites/AssetsPath.dart';

class backGroundWidget extends StatelessWidget {
  const backGroundWidget({super.key,required this.child});
final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsPath.backGroundImageSvgPath,width:double.infinity,height:double.infinity,fit: BoxFit.cover,),
        SafeArea(child: child)
      ],
    );
  }
}
