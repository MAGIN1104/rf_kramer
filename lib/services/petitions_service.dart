import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/PetitionModel.dart';

class PetitionService {
  final String _baseUrl = dotenv.env['API_URL'] ?? 'API_URL not found';
  Future<int> postPetition(PetitionModel newPetition) async {
    final url = Uri.https(_baseUrl, 'petitions.json');
    try {
      final resp = await http.post(url, body: newPetition.toJson());
      return resp.statusCode;
    } catch (e) {
      return -1;
    }
  }
}
