import 'package:fluent_ui/fluent_ui.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: Text("Order List "),),
          
        ],
      ),
    );
  }
}
