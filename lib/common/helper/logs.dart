import 'dart:developer' as developer;
import 'package:baity_app/common/models/log_storage_model.dart';

void logMessage(String message) {
  LogStorage.addLog(message);
  developer.log(message); // Optional: Still send logs to console
}