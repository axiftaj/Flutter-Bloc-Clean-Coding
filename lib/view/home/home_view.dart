import 'package:flutter/material.dart';

import '../../configs/components/loading_widget.dart';
import '../../configs/components/network_image_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Popular Shows'),
        actions: const [
          SizedBox(width: 20,)
        ],
      ),
      body: Text('') ,
    );
  }
}

