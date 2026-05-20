import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/create_new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // ටෙක්ස්ට් ෆීල්ඩ් 4 සඳහා Controllers
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  final TextEditingController _c3 = TextEditingController();
  final TextEditingController _c4 = TextEditingController();

  // කොටු අතර මාරු වෙන්න අවශ්‍ය FocusNodes
  final FocusNode _f1 = FocusNode();
  final FocusNode _f2 = FocusNode();
  final FocusNode _f3 = FocusNode();
  final FocusNode _f4 = FocusNode();

  @override
  void dispose() {
    _c1.dispose(); _c2.dispose(); _c3.dispose(); _c4.dispose();
    _f1.dispose(); _f2.dispose(); _f3.dispose(); _f4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 48, // Padding එක අඩු කරලා
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),

                      // විස්තරය
                      const Text(
                        "Code has been send to +1 111 ******99",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // OTP කොටු හතර
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _otpBox(_c1, _f1, _f2, null),
                          _otpBox(_c2, _f2, _f3, _f1),
                          _otpBox(_c3, _f3, _f4, _f2),
                          _otpBox(_c4, _f4, null, _f3),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Resend Code අකුරු ටික
                      RichText(
                        text: const TextSpan(
                          text: "Resend code in ",
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          children: [
                            TextSpan(
                              text: "53 s",
                              style: TextStyle(color: Color(0xFF480177), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // බටන් එක යටටම තල්ලු කරන්න දාන Spacer එක
                      const Spacer(),

                      // Verify Button එක
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            // Verify කෝඩ් එක ගන්න විදිහ
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateNewPasswordScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF480177),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Verify",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // OTP කොටුවක් හදන Custom Widget එක
  Widget _otpBox(TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus, FocusNode? prevFocus) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // එක කොටුවකට එක අකුරයි
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "", // යටින් එන ඉලක්කම් ගණන අයින් කරන්න
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF480177), width: 2), // Select වුනාම එන තැඹිලි බෝඩරය
          ),
        ),
        onChanged: (value) {
          // ඉලක්කමක් ගැහුවම ඊළඟ කොටුවට යනවා
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus(); // අන්තිම කොටුවේදී කීබෝඩ් එක පල්ලෙහාට යනවා
            }
          }
          // ඉලක්කමක් මැකුවම කලින් කොටුවට යනවා
          else {
            if (prevFocus != null) {
              FocusScope.of(context).requestFocus(prevFocus);
            }
          }
        },
      ),
    );
  }
}