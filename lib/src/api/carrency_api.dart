import 'dart:convert';

import 'package:http/http.dart' as http;

class Caremcy {
  Future<double?> oneUSDToIQD() async {
    String theUrl =
        "https://freecurrencyapi.net/api/v2/latest?apikey=9d1e2b10-7a02-11ec-95c4-d9cc216cc1df";

    http.Response response = await http.get(Uri.parse(theUrl));

    // decode the json body to a list<dynamic>
    return jsonDecode(response.body)["data"]["IQD"] as double;
  }
}
