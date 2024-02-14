import 'package:flutter/material.dart';
import 'package:laza_project/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool switchbutton = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: double.infinity,
        height: 75,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xff9775FA),
            shape: const RoundedRectangleBorder(),
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFFEFEFE),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.06,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // CustomBackButton(icon: const Icon(Icons.arrow_back)),
            const Center(
              child: SizedBox(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 6,
                    letterSpacing: -0.21,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a Username',
                    label: Text(
                      'Username',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a Password',
                    label: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter an Email Address',
                    label: Text(
                      'Email Address',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF1D1E20),
                      fontSize: 13,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 220),
                    child: Switch(
                        // activeColor: const Color(0xff34C759),
                        value: switchbutton,
                        onChanged: (value) {
                          switchbutton = value;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
