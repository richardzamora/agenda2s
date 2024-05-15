import 'agenda2.dart';

void main() async {
  env = await LoadEnvHelper.loadEnvFile('assets/env/dev/.env_dev');
  await initApp(Environment.Dev);
}
