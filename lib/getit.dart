import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaSingleTone {
  GetIt getit = GetIt.instance();
  Setup() {
    getit.registerSingleton((Supabase.instance.client));
  }
}
