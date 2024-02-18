import 'agenda2.dart';

void main() async {
  env = await LoadEnvHelper.loadEnvFile('assets/env/mock/.env_mock');
  await initApp(Environment.Mock);
}
