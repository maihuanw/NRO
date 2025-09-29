import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final TextEditingController _searchController1 = TextEditingController();
  final TextEditingController _searchController2 = TextEditingController();

  // Sample data for demonstration
  List<Map<String, dynamic>> rechargeHistory = [];
  List<Map<String, dynamic>> transactionHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Lịch Sử',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Recharge History Section
            _buildHistorySection(
              title: 'Lịch Sử Nạp Thẻ',
              searchController: _searchController1,
              headers: [
                'ID',
                'Mã Giao Dịch',
                'Số Serial',
                'Mã Thẻ',
                'Thực Nhận',
                'Mệnh Giá',
                'Ghi Chú',
                'Trạng Thái',
                'Tài Khoản',
                'Thời Gian'
              ],
              data: rechargeHistory,
            ),

            SizedBox(height: 20),

            // Transaction History Section
            _buildHistorySection(
              title: 'Lịch Sử Giao Dịch',
              searchController: _searchController2,
              headers: [
                'ID',
                'Mã Giao Dịch',
                'Số Dư Trước',
                'Số Tiền',
                'Số Dư Sau',
                'Nội Dung',
                'Tài Khoản',
                'Thời Gian',
                'Cập Nhật'
              ],
              data: transactionHistory,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistorySection({
    required String title,
    required TextEditingController searchController,
    required List<String> headers,
    required List<Map<String, dynamic>> data,
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Search Bar
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _performSearch(searchController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A5A4A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Data Table
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 32),
                child: DataTable(
                  headingRowHeight: 50,
                  dataRowHeight: 50,
                  columnSpacing: 16,
                  headingTextStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  dataTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                  columns: headers.map((header) => DataColumn(
                    label: Container(
                      constraints: BoxConstraints(minWidth: 80),
                      child: Text(
                        header,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )).toList(),
                  rows: data.isEmpty ? [] : data.map((row) => DataRow(
                    cells: headers.map((header) => DataCell(
                      Container(
                        constraints: BoxConstraints(minWidth: 80),
                        child: Text(
                          row[header]?.toString() ?? '',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )).toList(),
                  )).toList(),
                ),
              ),
            ),
          ),

          // No Data Message
          if (data.isEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 48,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No data',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    // Implement search functionality here
    print('Searching for: $query');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tìm kiếm: $query'),
        backgroundColor: Color(0xFF4A5A4A),
      ),
    );
  }

  @override
  void dispose() {
    _searchController1.dispose();
    _searchController2.dispose();
    super.dispose();
  }
}

// Extension widget for demo with sample data
class HistoryScreenWithData extends StatefulWidget {
  @override
  _HistoryScreenWithDataState createState() => _HistoryScreenWithDataState();
}

class _HistoryScreenWithDataState extends State<HistoryScreenWithData> {
  final TextEditingController _searchController1 = TextEditingController();
  final TextEditingController _searchController2 = TextEditingController();

  // Sample data for demonstration
  List<Map<String, dynamic>> rechargeHistory = [
    {
      'ID': '001',
      'Mã Giao Dịch': 'RC001',
      'Số Serial': '1234567890',
      'Mã Thẻ': 'CARD001',
      'Thực Nhận': '100,000đ',
      'Mệnh Giá': '100,000đ',
      'Ghi Chú': 'Nạp thành công',
      'Trạng Thái': 'Hoàn thành',
      'Tài Khoản': 'user001',
      'Thời Gian': '2025-09-24 10:30',
    },
  ];

  List<Map<String, dynamic>> transactionHistory = [
    {
      'ID': '001',
      'Mã Giao Dịch': 'TX001',
      'Số Dư Trước': '50,000đ',
      'Số Tiền': '+100,000đ',
      'Số Dư Sau': '150,000đ',
      'Nội Dung': 'Nạp tiền',
      'Tài Khoản': 'user001',
      'Thời Gian': '2025-09-24 10:30',
      'Cập Nhật': '2025-09-24 10:30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Lịch Sử',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Recharge History Section
            _buildHistorySection(
              title: 'Lịch Sử Nạp Thẻ',
              searchController: _searchController1,
              headers: [
                'ID',
                'Mã Giao Dịch',
                'Số Serial',
                'Mã Thẻ',
                'Thực Nhận',
                'Mệnh Giá',
                'Ghi Chú',
                'Trạng Thái',
                'Tài Khoản',
                'Thời Gian'
              ],
              data: rechargeHistory,
            ),

            SizedBox(height: 20),

            // Transaction History Section
            _buildHistorySection(
              title: 'Lịch Sử Giao Dịch',
              searchController: _searchController2,
              headers: [
                'ID',
                'Mã Giao Dịch',
                'Số Dư Trước',
                'Số Tiền',
                'Số Dư Sau',
                'Nội Dung',
                'Tài Khoản',
                'Thời Gian',
                'Cập Nhật'
              ],
              data: transactionHistory,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistorySection({
    required String title,
    required TextEditingController searchController,
    required List<String> headers,
    required List<Map<String, dynamic>> data,
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Search Bar
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 40,
                      width: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _performSearch(searchController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A5A4A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Data Table
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 32),
                child: DataTable(
                  headingRowHeight: 50,
                  dataRowHeight: 50,
                  columnSpacing: 16,
                  headingTextStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  dataTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                  columns: headers.map((header) => DataColumn(
                    label: Container(
                      constraints: BoxConstraints(minWidth: 80),
                      child: Text(
                        header,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )).toList(),
                  rows: data.isEmpty ? [] : data.map((row) => DataRow(
                    cells: headers.map((header) => DataCell(
                      Container(
                        constraints: BoxConstraints(minWidth: 80),
                        child: Text(
                          row[header]?.toString() ?? '',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )).toList(),
                  )).toList(),
                ),
              ),
            ),
          ),

          // No Data Message
          if (data.isEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 48,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No data',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    // Implement search functionality here
    print('Searching for: $query');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tìm kiếm: $query'),
        backgroundColor: Color(0xFF4A5A4A),
      ),
    );
  }

  @override
  void dispose() {
    _searchController1.dispose();
    _searchController2.dispose();
    super.dispose();
  }
}