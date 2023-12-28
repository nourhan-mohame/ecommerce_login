import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User details section
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/profile_img.png'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('john.doe@example.com'),
            SizedBox(height: 24),
            // Tabs section
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'All Orders'),
                          Tab(text: 'Pending Shipments'),
                          Tab(text: 'Pending Payments'),
                          Tab(text: 'Finished Orders'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),

                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Another set of tabs section
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(icon: Icon(Icons.people), text: 'Invite Friends'),
                          Tab(icon: Icon(Icons.headset_mic), text: 'Customer Support'),
                          Tab(icon: Icon(Icons.star), text: 'Rate Our App'),
                          Tab(icon: Icon(Icons.lightbulb_outline), text: 'Make a Suggestion'),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
