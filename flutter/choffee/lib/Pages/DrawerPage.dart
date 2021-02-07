import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark mode", style: TextStyle(fontSize: 20)),
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    DynamicTheme.of(context).setBrightness(
                        Theme.of(context).brightness == Brightness.dark
                            ? Brightness.light
                            : Brightness.dark);
                  },
                  activeTrackColor: Theme.of(context).textTheme.body1.color,
                  activeColor: Theme.of(context).iconTheme.color,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
