import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // get credentials
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "expense-tracker-402513",
  "private_key_id": "653ae0e90c5bdad88ed400c8d08ce2e489412843",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCitdX7WSzVdznY\n3nen3iokuhbDqErzTC0tFKNHFCyEmi0ck/whrS0vhw3v4stDAjIuCa3rF9yC1+zv\ngYTih3BECwthcQWoGtmKKvSNY4ZkCEHRZblAbT7iTop9vGsNfPQb/MtS793KLZcU\n6NqTfH7/sZvPGkHDcYeS82kZHmDqJ+h00X45djN/K54CbAcCHlm9jQtY3886FzYY\n7AWLdJeZJl2SWxBw+GKRUkos8mdoUqMCjvnpN34MEHZdYE4H5qiKvH/OcQSwtzoj\n2XADU7A23PeIUXjPgc9ICSjX9FNgTxFI+IiO/87s62Uiw7+CICsFDb7jcVi6v+DM\naR9cu9j1AgMBAAECggEADLm0dS6TA/9JtKqniJHmpriFcxgh2S0+GO5qMQhZ9/qi\nkxTcLVpriYdM7ClHFOP30+PEE09/2p2JGsKSMkZTSIW68OFuRr4SK/fH6G6eJ4uB\ncZ9R/FY0SsOc72WxqLHQWgesyOfY0d5mwxxNYKdmEQONcvEz2gAye9LSMi75okPM\np0y4mPpToC+sd6Hsoo7RNLNXqde/YnIchYcx62p/P4WYzc1OeL9x9KtMN5RImtL4\nv96ejdTn3Iurz+d5cAEg8tUEfJkR4jIrpl7mH7VnOp656VEtUkSlN7OSk6zR2jFS\n9X/V5o7zL1T8UHKKvQYDGY64gvWDC33Jlx7RCbfGoQKBgQDTxJBAZExjaReqCcm5\nf7rgNY7sUM+JgFZEq/5gW4KdwKgwCnyb9Opmssj1RCOsQGogmajNB285GVO/IBxS\nyTHqUhLQE13Bd60Dg+Zg10T8P3vsWDKmJA1Z8Hxdty/8lcI6LJnUc4YhlbMH+LFF\nAQFM/pfwAOVvY1bcWTFtbduSVQKBgQDEsh4PXoWA5Z63AGbarmfMajoUTPSUJacj\ntrQk16/ytfnMLwGVCs2ZGsdnK69AhZCVvyHp+3xGn7FZCLvHj4ohHp9Bwva8fWIs\n13yHzDTZDLqXHubDv0F9WnlUd0HIwPoOJap4xN1eZWI6RbyYoonMdjSkdbBmkkZ2\npqZDLEoMIQKBgHt+9wzGMRIMOIOt/5kRFx8nvLiti8pJMIYNs2PoGez7bFnP08lz\nc7r+alk2KoOKcRmf4qPmwQMQdRlRlZLlyBk5UcVMdfGcZCZXpmM1RwK/1voGmUrw\nXWTk7PIOIYrwnvskBXWzBTbSwTxV2LNAGc0X7+1D6Ikj6oTH8x444cKdAoGBAK4U\nvgn4K8vCbU+laWJNTMxbj398BFJBaMVw48pfofb7G1Ocnpfb8c55JtWmkfpWu3ns\nqQU+b+TJXNphol+iKCvbwDMha+GyTntFU4+UKYmXfGRXEwFXeYyJ0CvzSCN2t1hh\n+ZfdE9aBgAf2xE2KPM7aJwkOp8p/1yEXqLp2ripBAoGAXi+jN58STSpveFr/j60r\n0RCHviZ0PyK6TP0mQn6XEVgS2YMUgfSZBjqMoEcmjD7o61eWegtCKPAnTI9RV9aK\nOAG0VJZjUJBUmQ9qH7aGd8FNRYWxmubr0aj+gKOWf2h1N9g2P+Q81+b2SJXqQzec\nekSCfkXP0CGz7QO1VDiUCT0=\n-----END PRIVATE KEY-----\n",
  "client_email": "expense-tracker@expense-tracker-402513.iam.gserviceaccount.com",
  "client_id": "117684765078598443069",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expense-tracker%40expense-tracker-402513.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  // spreadsheets id
  static const _spreadsheetId = '1FNXRRet9ktxRJHoHEuBzJr5h5k2KiVAHQTmTs4zrKig';

  // setup and connect the spreadsheets
  static final gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // initialize the spreadsheet
  Future init() async {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByIndex(0);
  }

}