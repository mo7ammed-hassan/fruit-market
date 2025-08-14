import 'package:flutter/material.dart';
import 'package:fruit_market/common/widgets/shadow_container.dart';
import 'package:fruit_market/core/constants/app_colors.dart';
import 'package:fruit_market/core/constants/app_strings.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputWithAutoCountry extends StatefulWidget {
  final void Function(PhoneNumber?)? onValidChanged;
  final String? title;

  const PhoneInputWithAutoCountry({super.key, this.onValidChanged, this.title});

  @override
  State<PhoneInputWithAutoCountry> createState() =>
      _PhoneInputWithAutoCountryState();
}

class _PhoneInputWithAutoCountryState extends State<PhoneInputWithAutoCountry> {
  final TextEditingController _controller = TextEditingController();

  String _iso = 'KW';
  String _dial = '+965';

  static const Map<String, ({String iso, String dial})> _dialToCountry = {
    '+965': (iso: 'KW', dial: '+965'),
    '+20': (iso: 'EG', dial: '+20'),
    '+966': (iso: 'SA', dial: '+966'),
    '+971': (iso: 'AE', dial: '+971'),
    '+1': (iso: 'US', dial: '+1'),
    '+44': (iso: 'GB', dial: '+44'),
  };

  Future<void> _onInputChanged() async {
    final raw = _controller.text.trim();

    if (raw.startsWith('+')) {
      for (final entry in _dialToCountry.entries) {
        if (raw.startsWith(entry.key)) {
          final iso = entry.value.iso;
          final dial = entry.value.dial;
          if (_iso != iso || _dial != dial) {
            setState(() {
              _iso = iso;
              _dial = dial;
            });
          }
          return;
        }
      }

      try {
        final info = await PhoneNumber.getRegionInfoFromPhoneNumber(raw);
        if (info.isoCode != null && info.dialCode != null) {
          final iso = info.isoCode!;
          final dial = info.dialCode!;
          if (iso != _iso || dial != _dial) {
            setState(() {
              _iso = iso.toUpperCase();
              _dial = dial;
            });
          }
          widget.onValidChanged?.call(info);
          return;
        }
      } catch (_) {}
    }

    widget.onValidChanged?.call(null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title?.isNotEmpty == true) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.red, size: 8),
            ],
          ),
          const SizedBox(height: 10),
        ],

        ShadowContainer(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.termsColor),
                  ),
                ),
                child: Text('$_iso ($_dial)'),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  onChanged: (_) => _onInputChanged(),
                  decoration: const InputDecoration(
                    hintText: AppStrings.mobileNumber,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
