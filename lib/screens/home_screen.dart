import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.white,
        title: const Text('واتساب بلوتوث'),
        actions: [
          IconButton(
            tooltip: 'البحث عن الأجهزة',
            icon: const Icon(Icons.bluetooth_searching),
            onPressed: _showBluetoothInfo,
          ),
          IconButton(
            tooltip: 'الإعدادات',
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: _chats.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bluetooth,
                    size: 64,
                    color: Color(0xFF075E54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'لا توجد محادثات حتى الآن',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 8),
                  Text('ابحث عن جهاز قريب لبدء المحادثة'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];

                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF075E54),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(chat['name'] ?? 'جهاز'),
                  subtitle: Text(
                    chat['lastMessage'] ?? 'ابدأ المحادثة',
                  ),
                  onTap: () {},
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.white,
        onPressed: _showBluetoothInfo,
        child: const Icon(Icons.message),
      ),
    );
  }

  void _showBluetoothInfo() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('الاتصال بالبلوتوث'),
        content: const Text(
          'سيتم هنا عرض الأجهزة القريبة بعد ربط الواجهة '
          'بخدمة البلوتوث الفعلية.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }
}