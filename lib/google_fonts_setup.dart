import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void setupGoogleFont() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
