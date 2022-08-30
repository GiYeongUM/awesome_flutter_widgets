import 'package:flutter/material.dart';

class AnimatedSnackBar {
  static style1({
    required BuildContext context,
    String? title,
    Color primaryColor = Colors.blue,
    Color backgroundColor = Colors.black,
    String? subTitle,
    String? actionLabel,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? actionLabelTextStyle,
    Function? onActionTap,
    IconData? iconData,
    double? height,
    double? width,
    double? iconAvatarRadius,
    Color? iconColor,
    Duration? duration,
    DismissDirection? direction,
    SnackBarBehavior? snackBarBehavior,
    bool? hasLabel,
  }) {
    var animationStart = false;
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: duration ?? const Duration(seconds: 3),
        dismissDirection: direction ?? DismissDirection.down,
        behavior: snackBarBehavior ?? SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        onVisible: (){
          animationStart = true;
          print(animationStart);
        },
        elevation: 0,
        content: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(15),
          child: AnimatedContainer(
            height: height ?? 70,
            decoration: BoxDecoration(
              color: animationStart ? backgroundColor : Colors.white.withOpacity(0),
            ),
            duration: const Duration(seconds: 1),
            child: CircleAvatar(
                        radius: iconAvatarRadius ?? 20,
                        backgroundColor: primaryColor,
                        child: Center(
                            child: Icon(iconData,
                                color: iconColor ?? Colors.black))),

            // Row(
            //   children: [
            //     Container(width: hasLabel ?? true ? 20 : 0, color: primaryColor),
            //     if (iconData != null) const SizedBox(width: 20),
            //     if (iconData != null)
            //       CircleAvatar(
            //           radius: iconAvatarRadius ?? 20,
            //           backgroundColor: primaryColor,
            //           child: Center(
            //               child: Icon(iconData,
            //                   color: iconColor ?? Colors.black))),
            //     const SizedBox(width: 20),
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(title ?? "",
            //             overflow: TextOverflow.ellipsis,
            //             style: titleTextStyle ??
            //                 const TextStyle(fontSize: 16, color: Colors.black)),
            //         if (subTitle != null)
            //           Container(
            //             margin: const EdgeInsets.only(top: 4),
            //             child: Text(subTitle,
            //                 overflow: TextOverflow.ellipsis,
            //                 style: subtitleTextStyle ??
            //                     const TextStyle(
            //                         fontSize: 12, color: Colors.black)),
            //           )
            //       ],
            //     ),
            //     const Spacer(),
            //     if (actionLabel != null)
            //       TextButton(
            //           onPressed: () {
            //             onActionTap;
            //           },
            //           child: Text(actionLabel,
            //               style: actionLabelTextStyle ??
            //                   TextStyle(fontSize: 10, color: primaryColor)))
            //   ],
            // ),
          ),
        )));
  }
}
