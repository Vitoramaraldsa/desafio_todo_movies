import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String apiKey = dotenv.env['HOST'] ?? '';
  static final String host = dotenv.env['API_KEY'] ?? '';
}
