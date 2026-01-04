import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                backgroundColor: Colors.white,
              ),
              accountName: const Text('Raksmey'),
              accountEmail: const Text('096 324 602 2'),
              decoration: BoxDecoration(color: Colors.green[700]),
            ),
            _drawerItem(Icons.network_cell, 'សេវាកម្ម 5G'),
            _drawerItem(Icons.sim_card, 'eSIM'),
            _drawerItem(Icons.lock, 'សុវត្ថិភាពគណនី'),
            _drawerItem(Icons.favorite, 'បញ្ចូលបញ្ចាំ'),
            _drawerItem(Icons.card_giftcard, 'eVoucher'),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('ចាកចេញ'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[700]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.of(context).pop(),
    );
  }

  Widget _topBalanceCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.green[700],
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Raksmey',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text('096 324 602 2',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700]),
                  onPressed: () {},
                  child: const Text('បង់លុយ'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('0.00', style: TextStyle(fontSize: 28, color: Colors.red)),
                      SizedBox(height: 6),
                      Text('បង់លុយសរុប', style: TextStyle(color: Colors.black54)),
                    ],

                  ),
                  const Spacer(),
                  SizedBox(
                    height: 72,
                    width: 72,
                    child: Image.asset('assets/mascot.png', fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickTiles(BuildContext context) {
    final items = [
      _quickTile(Icons.bolt, '5G Speed'),
      _quickTile(Icons.phone_iphone, 'eSIM'),
      _quickTile(Icons.security, 'សុវត្ថិភាព'),
      _quickTile(Icons.calendar_today, 'កាលវិភាគ'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items),
    );
  }

  Widget _quickTile(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green.withOpacity(0.12))),
          child: Icon(icon, color: Colors.green[700]),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _usageCard(BuildContext context) {
    // Example values; in a real app these would be dynamic
    const usedGb = 4.26;
    const totalGb = 10.0;
    final progress = (usedGb / totalGb).clamp(0.0, 1.0);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              height: 110,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      color: Colors.green[700],
                      backgroundColor: Colors.green[100],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${usedGb.toStringAsFixed(2)} GB',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      const Text('អ៊ីនធឺណេតទូទៅ',
                          style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _usageRow('ផ្ញើរសារក្នុងប្រពន្ធ័', '60/60 សារ'),
                  const SizedBox(height: 10),
                  _usageRow('តេក្នុងប្រពន្ធ័', '58/60 នាទី'),
                  const SizedBox(height: 10),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usageRow(String title, String value) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green[700], size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(title)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildBody(BuildContext context, {required bool cupertino}) {
    final content = SingleChildScrollView(
      child: Column(
        children: [
          _topBalanceCard(context),
          _quickTiles(context),
          _usageCard(context),
          const SizedBox(height: 40),
          // Placeholder for more sections
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                    'សេវាកម្មសម្រាប់អ្នក — កាតផ្សេងៗ និងព័ត៌មានបន្ថែម'),
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );

    if (cupertino) {
      return SafeArea(child: content);
    } else {
      return SafeArea(child: content);
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool cupertino) {
    if (cupertino) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: Container(),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('SmartNas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      );
    }
  }

  Widget _buildScaffold(BuildContext context) {
    final isIos = Platform.isIOS;
    if (isIos) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('SmartNas'),
        ),
        child: _buildBody(context, cupertino: true),
      );
    }

    // Material scaffold (Android)
    return Scaffold(
      appBar: _buildAppBar(context, false),
      drawer: _buildDrawer(context),
      body: _buildBody(context, cupertino: false),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ទំព័រ'),
          BottomNavigationBarItem(icon: Icon(Icons.verified), label: 'SmartVIP'),
          BottomNavigationBarItem(icon: Icon(Icons.router), label: 'Home Internet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'គណនី'),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'support',
            onPressed: () {},
            backgroundColor: Colors.green[700],
            child: const Icon(Icons.headset_mic),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.small(
            heroTag: 'coupon',
            onPressed: () {},
            backgroundColor: Colors.green[700],
            child: const Icon(Icons.percent),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }
}