import 'package:flutter/material.dart';

class TabOrnek extends StatefulWidget {
  const TabOrnek({super.key});

  @override
  State<TabOrnek> createState() => _TabOrnekState();
}

class _TabOrnekState extends State<TabOrnek> with SingleTickerProviderStateMixin {
  
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabbar Kullanım"),
        bottom: myTabBar(),             //appbarın ıcınde tanımlanır.
      ),
      bottomNavigationBar: myTabBarBottom(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.redAccent,
            child:const  Center(child: Text("TAB 1" , style: TextStyle(fontSize: 48),)),
          ),
          Container(
            color: Colors.blueGrey,
            child: const Center(child:  Text("TAB 2" , style: TextStyle(fontSize: 48),)),
          ),Container(
            color: Colors.greenAccent,
            child:const  Center(child: Text("TAB 3" , style: TextStyle(fontSize: 48),)),
          )
        ]
      ),
    );
  }

  TabBar myTabBar() {
    return TabBar(controller: tabController, tabs: const [
        Tab(
          icon: Icon(Icons.phone),
          text: "Tabbar 1",
        ),
        Tab(
          icon: Icon(Icons.linked_camera_rounded),
          text: "Tabbar 2",
        ),
        Tab(
          icon: Icon(Icons.real_estate_agent),
          text: "Tabbar 3",
        )
      ]);
  }

  Container myTabBarBottom() {
    return Container(
      color: Colors.teal,
      child: TabBar(controller: tabController, tabs: const [
          Tab(
            icon: Icon(Icons.phone),
            text: "Tabbar 1",
          ),
          Tab(
            icon: Icon(Icons.linked_camera_rounded),
            text: "Tabbar 2",
          ),
          Tab(
            icon: Icon(Icons.real_estate_agent),
            text: "Tabbar 3",
          )
        ]),
    );
  }
}
