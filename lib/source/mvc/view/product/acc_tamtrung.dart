import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: GameShopScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameShopScreen extends StatefulWidget {
  @override
  _GameShopScreenState createState() => _GameShopScreenState();
}

class _GameShopScreenState extends State<GameShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'Tất cả';
  String sortBy = 'Mặc định';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'Tài Khoản - ACC TÂM TRUNG',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Info Box
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop chỉ bán tài khoản ảo',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 4),
                        Text('Liên hệ ngay cho shop nếu acc không giống mô tả hoặc sai thông tin đăng nhập'),
                        SizedBox(height: 4),
                        Text('Chỉ giải quyết khiếu nại trong vòng 20 phút kể từ lúc khách nhận được acc'),
                        SizedBox(height: 4),
                        Text('Hướng dẫn lọc theo sever: Tại đây'),
                        SizedBox(height: 4),
                        Text('Link đổi mật khẩu: Tại đây'),
                        SizedBox(height: 4),
                        Text('CSKH/Zalo: 0966645030'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Filters
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Filter
                  Text(
                    'Chọn Mức Giá:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        items: ['Tất cả', 'Dưới 100k', '100k - 500k', 'Trên 500k']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Sort Filter
                  Text(
                    'Sắp Xếp Theo:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: sortBy,
                        isExpanded: true,
                        items: ['Mặc định', 'Giá tăng dần', 'Giá giảm dần', 'Mới nhất']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            sortBy = newValue!;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Search
                  Text(
                    'Tìm Kiếm:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm mã sản phẩm, trang phục,...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[600],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, size: 18),
                              SizedBox(width: 8),
                              Text('Tìm Kiếm'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart, size: 18),
                              SizedBox(width: 8),
                              Text('Đặt Lại'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Game List
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GameCard(
                      title: getGameTitle(index),
                      subtitle: getGameSubtitle(index),
                      imagePath: 'assets/game_${index + 1}.jpg', // Placeholder
                      price: getGamePrice(index),
                      discount: getGameDiscount(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getGameTitle(int index) {
    List<String> titles = [
      'Ngọc quanh: 41,29k/26,31k',
      'Hột octhuvct',
      'MS: 25099452',
      'Áo kimono thanh hóa',
      'Nón trắng',
      'Set áo đỏ'
    ];
    return titles[index % titles.length];
  }

  String getGameSubtitle(int index) {
    List<String> subtitles = [
      'Nhân Xuyết Lục + Thần\nGià dành: -50k',
      'Quy khách',
      'Trạng bị',
      'Lưu Khung Hoàng thành hóa\nThế lần xuyên thúc',
      'Vào buy đã sumo\nShu đoàn thưa chỉ 89%',
      'Phần thứ 6 hóan\ncủa cung'
    ];
    return subtitles[index % subtitles.length];
  }

  String getGamePrice(int index) {
    List<String> prices = ['26.31k', '150k', '89k', '45k', '120k', '75k'];
    return prices[index % prices.length];
  }

  String? getGameDiscount(int index) {
    if (index == 0) return '-50k';
    if (index == 2) return '-89%';
    return null;
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String price;
  final String? discount;

  const GameCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.orange[400],
                    ),
                  ),
                  if (discount != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          discount!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}