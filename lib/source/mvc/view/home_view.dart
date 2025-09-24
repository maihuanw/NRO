import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/source/mvc/view/auth/login_view.dart';
import 'package:nro/source/mvc/view/home/history_view.dart';
import 'package:nro/source/mvc/view/home/profile_view.dart';
import 'package:nro/source/mvc/view/home/top_up_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      drawer: _buildDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  height: 48,
                  child: Image.asset(
                      'assets/images/logo.jpg', fit: BoxFit.contain),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.language)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode)),
                const SizedBox(width: 6),
                Builder(
                  builder: (context) =>
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/banner.jpg',
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            _buildTopNapCard(),
            const SizedBox(height: 12),
            _buildInfoBox(),
            const SizedBox(height: 20),
            _buildKhoAcc(),
            const SizedBox(height: 20),
            _buildSupportSection(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/logo.jpg', height: 50),
            ),
            const Divider(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "MENU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _buildDrawerItem(Icons.shopping_cart, "Mua Tài Khoản", () {
              Get.to(HomeView());
            }),
            _buildDrawerItem(Icons.swap_horiz, "Lịch Sử Giao Dịch", () {
              Get.to(HistoryView());
            }),
            _buildDrawerItem(
                Icons.account_balance_wallet, "Nạp Tiền Tài Khoản", () {
              Get.to(TopUpView());
            }),
            _buildDrawerItem(Icons.person, "Thông Tin Tài Khoản", () {
              Get.to(ProfileView());
            }),
            _buildDrawerItem(Icons.logout, "Đăng Xuất", () {
              Get.offAll(LoginView());
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildTopNapCard() {
    final names = ['Chu*****', '091*******', 'Tua*******', 'Tai*******'];
    final amounts = [
      '+7.850.000 ₫',
      '+4.750.000 ₫',
      '+3.646.000 ₫',
      '+3.223.000 ₫'
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF3B3A36),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  'TOP Nạp Tháng 09',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: List.generate(4, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      leading: Text('${i + 1}.', style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                      title: Text(names[i]),
                      trailing: Text(
                        amounts[i],
                        style: TextStyle(color: Colors.red[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B3A36),
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: () {
                Get.to(() => TopUpView());
              },
              child: const Text(
                'NẠP TIỀN NGAY',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mua vàng ngọc giao dịch tự động tại vangngoctudong.com',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'Nhập acc, ngọc xanh giá cao liên hệ zalo 0966645030 hoặc 0854113178'),
          const SizedBox(height: 8),
          Wrap(
            children: [
              const Text('Hướng dẫn lọc đồ theo sever '),
              GestureDetector(
                onTap: () {},
                child: const Text('TẠI ĐÂY', style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Bán vàng sever super1 super2 tại mục dịch vụ shop shopkimtrong.net',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildKhoAcc() {
    return Center(
      child: Column(
        children: [
          const Text(
            'KHO ACC NGỌC RỒNG',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: 1),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.9,
            children: [
              buildAccCard('assets/images/acc1.jpg', 'ACC TẦM TRUNG',
                  'Đã Bán 767 | Còn 501'),
              buildAccCard('assets/images/acc2.jpg', 'ACC SƠ SINH CÓ ĐỆ TỬ',
                  'Đã Bán 376 | Còn 278'),
              buildAccCard(
                  'assets/images/acc3.jpg', 'ACC VIP', 'Đã Bán 25 | Còn 21'),
              buildAccCard(
                  'assets/images/acc4.jpg', 'KHO ĐỒ', 'Đã Bán 226 | Còn 482'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Shop uy tín giá rẻ có hầu hết các dịch vụ của game Ngọc rồng online, hỗ trợ nhiệt tình tận tâm, phục vụ quý khách hàng 24/24. Shop độc quyền và được vận hành bởi YTB KimTrongNRO',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            'LIÊN HỆ HỖ TRỢ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Liên hệ ngay cho CHĂM SÓC KHÁCH HÀNG nếu gặp bất cứ lỗi nào khi sử dụng dịch vụ trên shop. Thời gian hỗ trợ: 8h-23h',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          _buildSupportButton(Icons.facebook, 'Facebook'),
          const SizedBox(height: 10),
          _buildSupportButton(Icons.chat, 'Zalo 0393433084'),
          const SizedBox(height: 10),
          _buildSupportButton(Icons.email, 'huanmaiw@gmail.com'),
        ],
      ),
    );
  }

  Widget _buildSupportButton(IconData icon, String text) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        minimumSize: const Size(double.infinity, 48),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget buildAccCard(String img, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8)),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
          Padding( padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Text(
                  title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                const SizedBox(height: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6)),
                  ), onPressed: () {},
                  child: const Text( 'XEM TẤT CẢ',
                    style: TextStyle(color: Colors.white, fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

