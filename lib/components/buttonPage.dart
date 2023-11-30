import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonsState();
}

class _ButtonsState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Button Style'),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: () => {}, child: const Text('TextButton')),
              TextButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.ac_unit_outlined),
                  label: const Text('TextButton.icon')),
              TextButton.icon(
                  style: TextButton.styleFrom(
                    elevation: 0, // 去除阴影
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () => {},
                  icon: Icon(Icons.account_box),
                  label: Text('ElevatedButton.Icon.elevation')),
              Divider(),
              OutlinedButton(
                  onPressed: () => {}, child: const Text('OutlinedButton')),
              OutlinedButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.access_alarms_outlined),
                  label: const Text('OutlinedButton.icon')),
              Divider(),
              ElevatedButton(
                  onPressed: () => {}, child: const Text('ElevatedButton')),
              ElevatedButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.account_box),
                  label: Text('ElevatedButton.Icon')),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 4, // 去除阴影
                  ),
                  onPressed: () => {},
                  icon: Icon(Icons.account_box),
                  label: Text('ElevatedButton.Icon.elevation')),
            ],
          ),
        ));
  }
}
