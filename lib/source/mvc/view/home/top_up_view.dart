import 'package:flutter/material.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({super.key});

  @override
  State<TopUpView> createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  String? loaiThe;
  String? menhGia;
  final serialController = TextEditingController();
  final maTheController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Nạp Thẻ"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hướng dẫn
            const Text(
              "Chiết khấu thẻ cào 20% cho tất cả các loại thẻ (nạp 10k được 8k)\n\n"
                  "Nạp ATM tự động không bị trừ chiết khấu (nạp 10k được 10k), tiền cộng trong vài phút\n\n"
                  "Quét mã QR để nạp trực tiếp không cần chỉnh sửa nội dung\n\n"
                  "Nạp bằng copy số tài khoản cần ghi đúng nội dung, ghi sai sẽ không được cộng tiền\n\n"
                  "Ghi sai nội dung hoặc nạp quá 30 phút mà chưa được cộng tiền trên shop liên hệ zalo 0966645030 để xử lý",
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            // Form
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Loại Thẻ"),
                    value: loaiThe,
                    items: ["Viettel", "Mobifone", "Vinaphone"]
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => loaiThe = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Mệnh Giá"),
                    value: menhGia,
                    items: ["10.000", "20.000", "50.000", "100.000"]
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => menhGia = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: serialController,
                    decoration: _inputDecoration("Số Serial"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: maTheController,
                    decoration: _inputDecoration("Mã Thẻ"),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Nếu Chọn Sai Mệnh Giá Sẽ Bị Mất Thẻ!",
                    style: TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Gửi dữ liệu lên server
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Đang gửi thẻ...")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Gửi",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Text("MSB : 02710011078816 \nChu Tai Khoan : NGUYEN VAN HUAN \nND: MH69"),
            Center(child: Image.asset("assets/images/qr.png", height: 200))
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
