part of '../home_page.dart';

class _PopUpMenuButton extends StatelessWidget {
  const _PopUpMenuButton({required this.onSelected,required this.selectedTempUnit});
  final void Function(TempUnits value)? onSelected;
  final TempUnits selectedTempUnit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TempUnits>(
      onSelected: onSelected,
      icon: Icon(Icons.more_horiz, color: Colors.white, size: 25.sp),
      color: Colors.grey[900],
      position: PopupMenuPosition.under,
      popUpAnimationStyle: const AnimationStyle(
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
      ),
      constraints: BoxConstraints(minWidth: ScreenUtil.screenWidth * 0.5),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: TempUnits.metric,

          child: ListTile(
            leading: selectedTempUnit == TempUnits.metric
                ? Icon(Icons.check, color: Colors.white, size: 25.w)
                : SizedBox(width: 25.w),
            title: Text("Celsius", style: context.bodyLarge),
            trailing: Text("°C", style: context.bodyLarge),
          ),
        ),
        PopupMenuItem(
          value: TempUnits.imperial,
          child: ListTile(
            leading: selectedTempUnit == TempUnits.imperial
                ? Icon(Icons.check, color: Colors.white, size: 25.w)
                : SizedBox(width: 25.w),
            title: Text("Fahrenheit", style: context.bodyLarge),
            trailing: Text("°F", style: context.bodyLarge),
          ),
        ),
        PopupMenuItem(
          value: TempUnits.standard,
          child: ListTile(
            leading: selectedTempUnit == TempUnits.standard
                ? Icon(Icons.check, color: Colors.white, size: 25.w)
                : SizedBox(width: 25.w),
            title: Text("Kelvin", style: context.bodyLarge),
            trailing: Text("K", style: context.bodyLarge),
          ),
        ),
      ],
    );
  }
}
