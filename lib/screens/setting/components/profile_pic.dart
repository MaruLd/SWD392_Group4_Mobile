import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 115,
        width: 115,
        child:Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Profile.png"),
            ),
            Positioned(
              right: -5,
              bottom: -10,

              child: SizedBox(
                height: 46,
                width: 46,
                child: FlatButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white)),
                  onPressed: (){},
                  child: SvgPicture.asset("assets/icons/camera.svg"),


                ),
              ),
            )
          ],
        )
    );
  }
}