import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryDropOff extends StatefulWidget {
  const DeliveryDropOff({
    super.key,
  });

  @override
  State<DeliveryDropOff> createState() => _DeliveryDropOffState();
}

class _DeliveryDropOffState extends State<DeliveryDropOff> {
  bool isExpanded = false;
  String _selectedCity = 'Lagos';
  String _selectedArea = 'Ikeja';

  final List<String> _cities = ['Lagos', 'Abuja', 'Port Harcourt'];
  final List<String> _areas = ['Ikeja', 'Lekki', 'Yaba'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery and drop-off',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xff343434),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: Icon(isExpanded
                  ? Icons.keyboard_arrow_up_outlined
                  : Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isExpanded ? null : 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter Location',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff818181),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton<String>(
                          dropdownColor: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(8),
                          elevation: 0,
                          isExpanded: true,
                          value: _selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCity = newValue!;
                            });
                          },
                          items: _cities
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343434),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<String>(
                          dropdownColor: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(8),
                          elevation: 0,
                          isExpanded: true,
                          value: _selectedArea,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedArea = newValue!;
                            });
                          },
                          items: _areas
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff343434),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Home deliveries and drop-offs take 2-5 working days. '
                    'All deliveries within Lagos range betwe  en #1,500 - #3,000. '
                    'Outside Lagos deliveries cost more.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff818181),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
