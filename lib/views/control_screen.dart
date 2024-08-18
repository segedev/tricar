import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tricar/core/app_colors.dart';
import 'package:tricar/viewmodels/device_controller.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DeviceController>(context, listen: false);

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
            vertical: size.height * 0.01,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              controlColumn(context, controller, [
                () => controller.onLeftPivot(),
                () => controller.onForward(),
                () => controller.onBackward(),
                () => controller.onRightPivot(),
              ]),
              hornAndLampControls(controller),
              controlColumn(context, controller, [
                () => controller.onLeftSmooth(),
                () => controller.onForward(),
                () => controller.onBackward(),
                () => controller.onRightSmooth(),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget controlColumn(BuildContext context, DeviceController controller,
      List<VoidCallback> actions) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildControlButton(
            context,
            Icons.arrow_drop_up_rounded,
            actions[1],
            controller.onOff,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildControlButton(
                context,
                Icons.arrow_left_rounded,
                actions[0],
                controller.onOff,
              ),
              const Icon(
                Icons.circle_rounded,
                size: 66,
                color: AppColors.button,
              ),
              buildControlButton(
                context,
                Icons.arrow_right_rounded,
                actions[3],
                controller.onOff,
              ),
            ],
          ),
          buildControlButton(
            context,
            Icons.arrow_drop_down_rounded,
            actions[2],
            controller.onOff,
          ),
        ],
      ),
    );
  }

  Widget hornAndLampControls(DeviceController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildHornandLampControlButton(null, Icons.speaker_rounded,
            controller.onHorn, controller.onHornOff),
        Column(
          children: [
            const Icon(
              Icons.wifi_tethering,
              color: AppColors.button,
              size: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Created by ',
                style: TextStyle(
                  color: AppColors.button.withOpacity(0.65),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: 'Dubem guy',
                    style: TextStyle(
                      color: AppColors.button.withOpacity(1),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        buildHornandLampControlButton(
          null,
          Icons.lightbulb_rounded,
          controller.onLamp,
          controller.onLampOff,
        ),
      ],
    );
  }

  Widget buildHornandLampControlButton(
      BuildContext? context, IconData icon, VoidCallback onTap,
      [VoidCallback? onTapUp]) {
    return GestureDetector(
      onTapDown: (_) => onTap(),
      onTapUp: onTapUp != null ? (_) => onTapUp() : null,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.bg2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          size: 40,
          color: AppColors.button,
        ),
      ),
    );
  }

  Widget buildControlButton(
      BuildContext? context, IconData icon, VoidCallback onTap,
      [VoidCallback? onTapUp]) {
    return GestureDetector(
      onTapDown: (_) => onTap(),
      onTapUp: onTapUp != null ? (_) => onTapUp() : null,
      child: Transform.scale(
        scale: 4,
        child: Icon(
          icon,
          size: 66,
          color: AppColors.button,
        ),
      ),
    );
  }
}
