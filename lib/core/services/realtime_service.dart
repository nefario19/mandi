import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/utils/logger.dart';

class RealtimeService {
  final Realtime _realtime;
  RealtimeSubscription? _subscription;
  final Map<String, StreamController<RealtimeMessage>> _channelControllers = {};

  RealtimeService() : _realtime = Realtime(locator<ClientService>().client) {
    Logger.init(runtimeType.toString());
  }

  Stream<RealtimeMessage> subscribe(String channel) {
    Logger.info(runtimeType.toString(), '[RealtimeService] 📡 Subscribing to: $channel');

    if (!_channelControllers.containsKey(channel)) {
      final controller = StreamController<RealtimeMessage>.broadcast();
      _channelControllers[channel] = controller;
      _updateSubscription();
    }

    final controller = _channelControllers[channel];

    if (controller == null) {
      throw StateError('Controller for channel $channel not found');
    }

    return controller.stream;
  }

  void _updateSubscription() {
    Logger.info(runtimeType.toString(), '🔄 Updating subscription...');

    _subscription?.close();

    final channels = _channelControllers.keys.toList();

    if (channels.isEmpty) {
      Logger.info(runtimeType.toString(), '⚠️ No active channels');
      return;
    }

    Logger.info(runtimeType.toString(), '📡 Subscribing to: $channels');

    _subscription = _realtime.subscribe(channels);

    _subscription!.stream.listen(
      (realtimeMessage) {
        Logger.log(runtimeType.toString(), '📨 Event: ${realtimeMessage.events}');

        for (final entry in _channelControllers.entries) {
          final channelName = entry.key;
          final controller = entry.value;

          if (realtimeMessage.channels.contains(channelName)) {
            controller.add(realtimeMessage);
            Logger.log(runtimeType.toString(), '↗️  Routed to: $channelName');
          } else {
            Logger.info(runtimeType.toString(),
                '   ❌ Skipped: $channelName (not in ${realtimeMessage.channels})');
          }
        }
      },
      onError: (error) {
        Logger.log(runtimeType.toString(), '❌ Error: $error');
      },
    );
  }

  void dispose() {
    _subscription?.close();

    for (final controller in _channelControllers.values) {
      controller.close();
    }

    _channelControllers.clear();
    Logger.disposed(runtimeType.toString());
  }
}
