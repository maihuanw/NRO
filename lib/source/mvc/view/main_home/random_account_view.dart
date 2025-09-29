
import 'package:flutter/material.dart';

class RandomAccountView extends StatefulWidget {
  const RandomAccountView({super.key});

  @override
  _RandomAccountViewState createState() => _RandomAccountViewState();
}

class _RandomAccountViewState extends State<RandomAccountView> {
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
                      'Tài Khoản - ACC SƠ SINH CÓ ĐỆ TỬ',
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
                      border: Border.all(color: Colors.red[300]!),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop chỉ bán tài khoản ảo',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red[700],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Liên hệ ngay cho shop nếu acc không giống mô tả hoặc sai thông tin đăng nhập',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Chỉ giải quyết khiếu nại trong vòng 20 phút kể từ lúc khách nhận được acc',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Hướng dẫn lọc theo sever: Tại đây',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Link đổi mật khẩu: Tại đây',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'CSKH/Zalo: 0966645030',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Filters Row
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // Category Filter
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chọn Mức Giá:',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedCategory,
                              isExpanded: true,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                              items: ['Tất cả', 'Dưới 20k', '20k - 50k', 'Trên 50k']
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
                      ],
                    ),
                  ),

                  SizedBox(width: 12),

                  // Sort Filter
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sắp Xếp Theo:',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: sortBy,
                              isExpanded: true,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                              items: ['Mặc định', 'Giá tăng dần', 'Giá giảm dần']
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
                      ],
                    ),
                  ),

                  SizedBox(width: 12),

                  // Search and Buttons
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tìm Kiếm:',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: 'Tìm kiếm mã sản phẩm...',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[600],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                minimumSize: Size(0, 32),
                              ),
                              child: Text('Tìm Kiếm', style: TextStyle(fontSize: 10)),
                            ),
                            SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[400],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                minimumSize: Size(0, 32),
                              ),
                              child: Text('Đặt Lại', style: TextStyle(fontSize: 10)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Game Account List
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GameAccountCard(
                      accountId: getAccountId(index),
                      serverInfo: getServerInfo(index),
                      price: getAccountPrice(index),
                      statusTags: getStatusTags(index),
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

  String getAccountId(int index) {
    List<String> ids = [
      'MS: 25093943',
      'MS: 25096795',
      'MS: 25098741',
      'MS: 25099124',
      'MS: 25099876',
      'MS: 25100234',
      'MS: 25100567',
      'MS: 25100891',
      'MS: 25101234'
    ];
    return ids[index % ids.length];
  }

  String getServerInfo(int index) {
    List<String> servers = [
      'Nm đt tss\ndụ ngọc',
      'Nm sv2\ndụ ngọc đệ\ntss',
      'xđ sv2',
      'Sv1 full\nđồ vip',
      'Sv3 tân thủ\ncó đệ tử',
      'Sv2 cao cấp\nfull set',
      'Sv1 vip pro\nmax level',
      'Sv4 limited\nrare items',
      'Sv3 special\nevent acc'
    ];
    return servers[index % servers.length];
  }

  String getAccountPrice(int index) {
    List<String> prices = [
      '16.000 ₫',
      '17.000 ₫',
      '10.000 ₫',
      '25.000 ₫',
      '18.000 ₫',
      '22.000 ₫',
      '30.000 ₫',
      '15.000 ₫',
      '20.000 ₫'
    ];
    return prices[index % prices.length];
  }

  List<AccountTag> getStatusTags(int index) {
    List<List<AccountTag>> tagsList = [
      [AccountTag('Nm đt tss\ndụ ngọc', Colors.pink[600]!)],
      [AccountTag('Nm sv2\ndụ ngọc đệ\ntss', Colors.blue[600]!)],
      [
        AccountTag('xđ sv2', Colors.purple[600]!),
        AccountTag('đệ nm', Colors.teal[600]!)
      ],
      [AccountTag('vip pro', Colors.orange[600]!)],
      [AccountTag('tân thủ', Colors.green[600]!)],
      [AccountTag('cao cấp', Colors.red[600]!)],
      [AccountTag('max lv', Colors.indigo[600]!)],
      [AccountTag('limited', Colors.amber[700]!)],
      [AccountTag('special', Colors.cyan[600]!)]
    ];
    return tagsList[index % tagsList.length];
  }
}

class AccountTag {
  final String text;
  final Color color;

  AccountTag(this.text, this.color);
}

class GameAccountCard extends StatelessWidget {
  final String accountId;
  final String serverInfo;
  final String price;
  final List<AccountTag> statusTags;

  const GameAccountCard({
    Key? key,
    required this.accountId,
    required this.serverInfo,
    required this.price,
    required this.statusTags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Game Screenshot
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlue[200]!,
                    Colors.green[200]!,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Game interface mockup
                  Positioned.fill(
                    child: CustomPaint(
                      painter: GameInterfacePainter(),
                    ),
                  ),
                  // Account ID overlay
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        accountId,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Status Tags
          if (statusTags.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Wrap(
                spacing: 4,
                runSpacing: 2,
                children: statusTags.map((tag) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: tag.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tag.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )).toList(),
              ),
            ),

          // Price and Buy Button
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on, size: 12, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size(0, 24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart, size: 10),
                      SizedBox(width: 4),
                      Text(
                        'Chi Tiết',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameInterfacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Sky background
    paint.color = Colors.lightBlue[300]!;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height * 0.6), paint);

    // Ground
    paint.color = Colors.brown[300]!;
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4), paint);

    // Character (simple circle)
    paint.color = Colors.red[400]!;
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.7),
      8,
      paint,
    );

    // Simple UI elements
    paint.color = Colors.black54;
    canvas.drawRect(Rect.fromLTWH(5, 5, size.width - 10, 15), paint);

    // Health bar
    paint.color = Colors.red;
    canvas.drawRect(Rect.fromLTWH(8, 8, (size.width - 16) * 0.8, 9), paint);

    paint.color = Colors.green;
    canvas.drawRect(Rect.fromLTWH(8, 8, (size.width - 16) * 0.6, 9), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
