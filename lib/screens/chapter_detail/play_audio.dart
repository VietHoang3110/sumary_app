import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sumary_app/api_resfull/LocalStorage.dart';
import 'package:sumary_app/widgets/widget_text.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart' as SS;

import '../../bloc/detail_product/detail_product_bloc.dart';
import '../../src/models/model_generator/detail_productt.dart';
import '../../src/src_index.dart';
import '../../widgets/widget_dialog.dart';

class Audio extends StatefulWidget {
  final String id;
  final String title;
  final List<DataVoice> voice;
  final List<DataFile> file;
  final String urlBook;
  int bookSelect;
  final bool isBuy;
  Function? changeBookSelect;
  final bool isSave;

  Audio(
      {Key? key,
      required this.id,
      required this.voice,
      required this.file,
      required this.urlBook,
      required this.title,
      required this.changeBookSelect,
      required this.isBuy,
      required this.bookSelect,
      required this.isSave})
      : super(key: key);

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  late List<String?> listUrl;

  late List<String?> listUrlFile;
  late String title;
  // bool isReady = true;
  int index = 0;
  int indexSpeed = 3;
  LocalStorage storage = LocalStorage();

  List<double> speed = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];

  @override
  void initState() {
    super.initState();
    // listUrl = List.generate(widget.voice.length, (index) => null);

    // listUrlFile = List.generate(widget.file.length, (index1) => '');
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    title = widget.title;
    index = widget.bookSelect;
    List<String> listStringUrl = [];
    for (int i = 0; i < widget.voice.length; i++) {
      listStringUrl.add(widget.voice[i].src!);
    }
    setState(() {
      listUrl = listStringUrl;
    });
    _init();
    initUrlAudio();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  initUrlAudio() async {
    try {
      if(widget.isSave) {
        var taskId = storage.getStorageByKey(listUrl[index]!);
        String localPath;
        if(Platform.isAndroid) {
          localPath = (await getExternalStorageDirectory())!.absolute.path + "/download";
        } else {
          localPath = (await getApplicationDocumentsDirectory()).path + "/download";
        }
        if(taskId != null) {
          _player.setAudioSource(AudioSource.uri(
            Uri.file(
                "$localPath/${listUrl[index]}"),
            tag: MediaItem(
              id: widget.voice[index].id.toString(),
              title: widget.voice[index].name.toString(),
              artUri: Uri.parse(widget.urlBook),
            ),
          ));
        }
      } else {
        _player.setAudioSource(AudioSource.uri(
          Uri.parse(
              "https://api.tiemnangmaster.com/upload/get-voice/${listUrl[index]}"),
          tag: MediaItem(
            id: widget.voice[index].id.toString(),
            title: widget.voice[index].name.toString(),
            artUri: Uri.parse(widget.urlBook),
          ),
        ));
      }
      // ContentFileBloc.of(context).add(InitContentFileEvent(listUrlFile[index] ?? ''));
    } catch (e) {
      Get.snackbar("Lỗi file", "Có lỗi xảy ra", backgroundColor: Colors.white);
    }
  }

  previousAudio() {
    _player.stop();
    // print("audio index: ${index} && url: ${listUrl[index]}");
    index = index == 0 ? 0 : index - 1;
    widget.changeBookSelect!(index, widget.file[index].src);
    // listUrl[index] == null ? null : await initUrlAudio();
    initUrlAudio();
    // ContentFileBloc.of(context)
    //     .add(InitContentFileEvent(listUrlFile[index] ?? ''));
  }

  nextAudio() async {
    if (widget.isBuy == true) {
      _player.stop();
      index = index == (widget.voice.length - 1)
          ? (widget.voice.length - 1)
          : index + 1;
      widget.changeBookSelect!(index, widget.file[index].src);
      // if (listUrl[index] == null) {
      //   DetailProductBloc.of(context).add(InitDetailProductEvent(widget.id));
      // } else {
      await initUrlAudio();
      // }
      // listUrlFile[index] == null
      //     ? null
      //     : ContentFileBloc.of(context)
      //         .add(InitContentFileEvent(listUrlFile[index] ?? ''));
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WidgetDialog(
            title: MESSAGES.NOTIFICATION,
            content: 'Bạn cần mua sách để đọc tiếp!!!!',
            onTap1: () {
              Get.back();
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      SS.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  Future forward5Seconds() async => goToPosition(
      (currentPosition) => currentPosition + const Duration(seconds: 10));

  Future rewind5Seconds() async => goToPosition(
      (currentPosition) => currentPosition - const Duration(seconds: 10));

  Future goToPosition(
    Duration Function(Duration currentPosition) builder,
  ) async {
    final currentPosition = _player.position;
    final newPosition = builder(currentPosition);
    await _player.seek(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductBloc, DetailProductState>(
      builder: (context, state) {
        // if (state is UpdateGetDetailProductState &&
        //     listUrl[index] == null &&
        //     listUrlFile[index] == '') {
        //   listUrl[index] = state.data.book!.voice![index].src;
        //   listUrlFile[index] =
        //       state.data.book!.file![index].src.toString().split("/").last;
        //   title = state.data.book!.file![index].name!;
        //   initUrlAudio();
        // }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.16),
              child: CustomPaint(
                  size: const Size(15, 15), painter: DrawTriangle()),
            ),
            Container(
              width: AppValue.widths,
              decoration: BoxDecoration(
                  color: COLORS.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: WidgetText(
                            title: 'Audio',
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: COLORS.WHITE),
                          ),
                          onTap: () {
                            // AppNavigator.navigateTest();
                          },
                        ),
                        GestureDetector(
                          child: WidgetText(
                            title: "x" + speed[indexSpeed].toString(),
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: COLORS.WHITE),
                          ),
                          onTap: () {
                            setState(() {
                              if(indexSpeed < 7 ){
                                indexSpeed = indexSpeed + 1;
                              }
                              else{
                                indexSpeed = 0;
                              }
                              _player.setSpeed(speed[indexSpeed]);
                            });
                          },
                        ),
                        // Row(
                        //   children: [
                        //     SvgPicture.asset('assets/icons/setting_3.svg'),
                        //     AppValue.hSpaceTiny,
                        //     const Icon(
                        //       Icons.arrow_drop_down,
                        //       color: COLORS.WHITE,
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  //Todo: Audio
                  StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      final positionData = snapshot.data;
                      // print('audio: ${snapshot.data!.duration} ${snapshot.data!.position}');
                      return SeekBar(
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                            positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: (newPosition) {
                          _player.seek(newPosition);
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<SequenceState?>(
                          stream: _player.sequenceStateStream,
                          builder: (context, snapshot) => GestureDetector(
                              child:
                                  SvgPicture.asset("assets/icons/next_1.svg"),
                              onTap: () {
                                previousAudio();
                                title;
                              }),
                        ),
                        StreamBuilder<SequenceState?>(
                            stream: _player.sequenceStateStream,
                            builder: (context, snapshot) => InkWell(
                                  onTap: rewind5Seconds,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/timepast_1.svg'),
                                      Text(
                                        ' 10s',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: white),
                                      )
                                    ],
                                  ),
                                )),
                        StreamBuilder<PlayerState>(
                          stream: _player.playerStateStream,
                          builder: (context, snapshot) {
                            final playerState = snapshot.data;
                            final processingState =
                                playerState?.processingState;
                            final playing = playerState?.playing;
                            if (processingState == ProcessingState.loading ||
                                processingState == ProcessingState.buffering) {
                              return Container(
                                child: const Icon(Icons.play_arrow,
                                    color: COLORS.WHITE),
                              );
                            } else if (playing != true) {
                              return GestureDetector(
                                child: const Icon(Icons.play_arrow,
                                    color: COLORS.WHITE),
                                onTap: _player.play,
                              );
                            } else if (processingState !=
                                ProcessingState.completed) {
                              return GestureDetector(
                                child: const Icon(Icons.pause,
                                    color: COLORS.WHITE),
                                onTap: _player.pause,
                              );
                            } else {
                              return GestureDetector(
                                child: const Icon(Icons.replay,
                                    color: COLORS.WHITE),
                                onTap: () => _player.seek(Duration.zero,
                                    index: _player.effectiveIndices!.first),
                              );
                            }
                          },
                        ),
                        StreamBuilder<SequenceState?>(
                            stream: _player.sequenceStateStream,
                            builder: (context, snapshot) => InkWell(
                                  onTap: forward5Seconds,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/timepast_2.svg'),
                                      Text(
                                        ' 10s',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: white),
                                      )
                                    ],
                                  ),
                                )),
                        StreamBuilder<SequenceState?>(
                          stream: _player.sequenceStateStream,
                          builder: (context, snapshot) => GestureDetector(
                              child:
                                  SvgPicture.asset("assets/icons/next_2.svg"),
                              onTap: () {
                                nextAudio();
                                setState(() {
                                  title;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = COLORS.PRIMARY_COLOR);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        thumbShape: const RoundSliderThumbShape(
            disabledThumbRadius: 1, enabledThumbRadius: 7));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SliderTheme(
        //   data: _sliderThemeData.copyWith(
        //     thumbShape: HiddenThumbComponentShape(),
        //   ),
        //   child: Slider(
        //     min: 0.0,
        //     max: widget.duration.inMilliseconds.toDouble(),
        //     value: min(
        //         widget.bufferedPosition.inMilliseconds.toDouble(),
        //         widget.duration.inMilliseconds.toDouble()),
        //     onChanged: (value) {
        //       setState(() {
        //         _dragValue = value;
        //       });
        //       if (widget.onChanged != null) {
        //         widget.onChanged!(Duration(milliseconds: value.round()));
        //       }
        //     },
        //     onChangeEnd: (value) {
        //       if (widget.onChangeEnd != null) {
        //         widget.onChangeEnd!(Duration(milliseconds: value.round()));
        //       }
        //       _dragValue = null;
        //     },
        //   ),
        // ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: const Color(0xffC4C4C4),
            valueIndicatorColor: Colors.white,
            thumbColor: Colors.white,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 24.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("${widget.duration}")
                      ?.group(1) ??
                  '${widget.duration}',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white)),
        ),
        Positioned(
          left: 24.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  // Duration startTime = Duration();
  Duration get _remaining => widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}
