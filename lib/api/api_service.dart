import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://polyedre.eu:8000/polyfx/cgi';

  // Vous pouvez changer entre td1 et td2 selon votre groupe
  static const String fournisseursEndpointTD1 = '/getfrstd1.cgi';
  static const String fournisseursEndpointTD2 = '/getfrstd2.cgi';
  static const String articlesEndpoint = '/getart.cgi';

  // Récupérer les fournisseurs
  static Future<List<dynamic>> fetchFournisseurs({bool isTD1 = true}) async {
    final String endpoint = isTD1 ? fournisseursEndpointTD1 : fournisseursEndpointTD2;
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors du chargement des fournisseurs');
    }
  }

  // Récupérer les articles d'un fournisseur
  static Future<List<dynamic>> fetchArticles(String fournisseurId) async {
    final response = await http.get(
      Uri.parse('$baseUrl$articlesEndpoint?frs=$fournisseurId'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }
}