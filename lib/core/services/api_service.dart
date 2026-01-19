import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Replace with your local IP if running on minimal emulator/web
  // For web (localhost)
  static const String baseUrl = 'https://riskhan-backend-production.up.railway.app';

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    // Add interceptor for JWT token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'jwt');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Handle 401 Unauthorized globally if needed
          return handler.next(e);
        },
      ),
    );
  }

  // Auth Operations
  Future<Response> login(String email, String password) async {
    return await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
  }

  Future<Response> register(
    String name,
    String email,
    String password,
    String phone,
    String address,
  ) async {
    return await _dio.post(
      '/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'address': address,
      },
    );
  }

  // User Operations
  Future<Response> getProfile() async {
    return await _dio.get('/auth/profile');
  }

  // Billing Operations
  Future<Response> getInvoices() async {
    return await _dio.get('/billing/invoices');
  }

  // Ticket Operations
  Future<Response> getTickets() async {
    return await _dio.get('/tickets');
  }

  Future<Response> createTicket(Map<String, dynamic> data) async {
    return await _dio.post('/tickets', data: data);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  Future<void> logout() async {
    await _storage.delete(key: 'jwt');
  }
}
