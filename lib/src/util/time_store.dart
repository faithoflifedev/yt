import 'package:fling_pickle/fling_pickle.dart';
import 'package:universal_io/io.dart';

class TimeStore implements Pickleable {
  DateTime timeStamp = DateTime.now();

  bool reset;

  String instanceName;

  TimeStore(
      {required this.timeStamp,
      this.reset = false,
      this.instanceName = 'instance'});

  factory TimeStore.fromMillis(int millis, {bool reset = false}) => TimeStore(
      timeStamp: DateTime.fromMillisecondsSinceEpoch(millis), reset: reset);

  factory TimeStore.fromStorage(String type, {bool reset = false}) =>
      File('.$type-chat.ts').existsSync()
          ? TimeStore.fromMillis(
              BinaryPickler()
                  .readSync(File('.$type-chat.ts').readAsBytesSync())
                  .readInt('dateTime'),
              reset: reset)
          : TimeStore(timeStamp: DateTime(2000));

  factory TimeStore.fromPickle(final Pickle pickle) =>
      TimeStore.fromMillis(pickle.readInt('dateTime'));

  @override
  Pickle asPickle() => PickleBuilder()
      .withInt('dateTime', timeStamp.millisecondsSinceEpoch)
      .build();

  void persist() => File('.$instanceName.ts')
      .writeAsBytesSync(BinaryPickler().writeSync(asPickle()));
}
