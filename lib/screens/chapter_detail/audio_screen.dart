import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:audio_session/src/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sumary_app/widgets/widget_text.dart';
import 'package:rxdart/rxdart.dart' as SS;
import 'package:text_scroll/text_scroll.dart';

import '../../api_resfull/LocalStorage.dart';
import '../../src/models/model_generator/detail_productt.dart';
import '../../src/spacing.dart';
import '../../src/src_index.dart';
import '../../storages/share_local.dart';
import '../../widgets/widget_dialog.dart';
import 'modal_sheet_book_same.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  DataDetailProduct dataBook =  Get.arguments[0];
  int indexChap =  Get.arguments[1];

  final _player = AudioPlayer();

  late List<String?> listUrl;

  late List<String?> listUrlFile;
  late String title;
  // bool isReady = true;
  int index = 0;
  int indexSpeed = 3;
  LocalStorage storage = LocalStorage();

  List<double> speed = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];

  bool autoNext = shareLocal.getBools(PreferencesKey.AUTO_NEXT_AUDIO);

  @override
  void initState() {
    super.initState();
    // listUrl = List.generate(widget.voice.length, (index) => null);

    // listUrlFile = List.generate(widget.file.length, (index1) => '');
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    title = dataBook.book!.file![index].name.toString();
    index = indexChap;
    List<String> listStringUrl = [];
    for (int i = 0; i < dataBook.book!.voice!.length; i++) {
      listStringUrl.add( dataBook.book!.voice![i].src!);
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
    _player.playbackEventStream.listen((event) {
    },
    onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  initUrlAudio() async {
    try {
      if(dataBook.is_save) {
        var taskId = storage.getStorageByKey(listUrl[index]!);
        String localPath;
        if(Platform.isAndroid) {
          localPath = (await getExternalStorageDirectory())!.absolute.path + "/download";
        } else {
          localPath = (await getApplicationDocumentsDirectory()).path + "/download";
        }
        if(taskId != null) {
          title =dataBook.book!.voice![index].name.toString();
          indexChap = index;
          _player.setAudioSource(AudioSource.uri(
            Uri.file(
                "$localPath/${listUrl[index]}"),
            tag: MediaItem(
              id: dataBook.book!.voice![index].id.toString(),
              title: dataBook.book!.voice![index].name.toString(),
              artUri: Uri.parse(dataBook.book!.images![0]),
            ),
          ));
        }
      } else {
        title =dataBook.book!.voice![index].name.toString();
        indexChap = index;
        _player.setAudioSource(AudioSource.uri(
          Uri.parse(
              "https://api.tiemnangmaster.com/upload/get-voice/${listUrl[index]}"),
          tag: MediaItem(
            id: dataBook.book!.voice![index].id.toString(),
            title: dataBook.book!.voice![index].name.toString(),
            artUri: Uri.parse(dataBook.book!.images![0]),
          ),
        ));
      }
      // ContentFileBloc.of(context).add(InitContentFileEvent(listUrlFile[index] ?? ''));
    } catch (e) {
      Get.snackbar("Lỗi file", "Có lỗi xảy ra", backgroundColor: Colors.white);
    }
  }

  previousAudio() async {
    _player.stop();
    index = index == 0 ? 0 : index - 1;
    await initUrlAudio();
  }

  nextAudio() async {
    if (dataBook.is_buy == true) {
      _player.stop();
      index = (index == (dataBook.book!.voice!.length - 1)) ? (dataBook.book!.voice!.length - 1) : index + 1;
      await initUrlAudio();
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
              position, bufferedPosition, duration ?? Duration.zero)
      );

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

  Future<void> auto() async {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppValue.heights,
        width: AppValue.widths,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(dataBook.book!.images![0]),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child:  Container(
            decoration:  BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Spacing.viewPadding.top, bottom: Spacing.viewPadding.bottom),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          AppValue.vSpaceTiny,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(onTap: () => Get.back(),child: SvgPicture.asset('assets/icons/chevron-right.svg')),
                                AppValue.hSpace(13),
                                WidgetText(
                                  title: "Tâm mục ${indexChap+1}",
                                  style: AppStyle.DEFAULT_18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(225, 225, 225, 1)
                                  ),
                                ),
                                AppValue.hSpaceTiny,
                                SvgPicture.asset('assets/icons/book_open.svg'),
                                const Spacer(),
                                SvgPicture.asset('assets/icons/share.svg'),
                                AppValue.hSpaceSmall,
                                // GestureDetector(
                                //     onTap: () {
                                //       scaffoldKey.currentState?.openEndDrawer();
                                //     },
                                //     child: SvgPicture.asset('assets/icons/list_icon.svg'))
                              ],
                            ),
                          ),
                          SizedBox(height: AppValue.heights*0.06,),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(dataBook.book!.images![0],
                                      height: AppValue.heights*0.36,
                                      fit: BoxFit.contain,
                              )
                          ),
                          SizedBox(height: AppValue.heights*0.07,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextScroll(
                              '${title}' + ' '*15,
                              mode: TextScrollMode.endless,
                              style: AppStyle.DEFAULT_24.copyWith(
                                color: COLORS.WHITE,
                                fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.right,
                              selectable: true,
                            ),
                          ),
                          AppValue.vSpaceSmall,
                          //Todo: Audio
                          StreamBuilder<PositionData>(
                            stream: _positionDataStream,
                            builder: (BuildContext context,snapshot) {
                              final positionData = snapshot.data;
                              return SeekBar(
                                duration: positionData?.duration ?? Duration.zero,
                                position: positionData?.position ?? Duration.zero,
                                bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                                onChanged: (value){
                                  if(positionData?.duration == positionData?.position){
                                    setState(() {
                                      nextAudio();
                                    });
                                  }
                                },
                                onChangeEnd: (newPosition) {
                                  _player.seek(newPosition);
                                },
                              );

                            },
                          ),

                          AppValue.vSpaceSmall,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StreamBuilder<SequenceState?>(
                                  stream: _player.sequenceStateStream,
                                  builder: (context, snapshot) => GestureDetector(
                                      child: SvgPicture.asset('assets/icons/audio_1.svg'),
                                      onTap: () {
                                        setState(() {
                                          previousAudio();
                                        });
                                      }
                                      ),
                                ),
                                StreamBuilder<SequenceState?>(
                                    stream: _player.sequenceStateStream,
                                    builder: (context, snapshot) => InkWell(
                                      onTap: rewind5Seconds,
                                      child: SvgPicture.asset('assets/icons/audio_2.svg')
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
                                      return SvgPicture.asset('assets/icons/audio_play.svg');
                                    } else if (playing != true) {
                                      return GestureDetector(
                                        child: SvgPicture.asset('assets/icons/audio_play.svg'),
                                        onTap: _player.play,
                                      );
                                    } else if (processingState !=
                                        ProcessingState.completed) {
                                      return GestureDetector(
                                        child: SvgPicture.asset('assets/icons/audio_offPlay.svg'),
                                        onTap: _player.pause,
                                      );
                                    } else {
                                      return GestureDetector(
                                        child: SvgPicture.asset('assets/icons/audio_play.svg'),
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
                                      child: SvgPicture.asset('assets/icons/audio_3.svg'),
                                    )),
                                StreamBuilder<SequenceState?>(
                                  stream: _player.sequenceStateStream,
                                  builder: (context, snapshot) => GestureDetector(
                                      child: SvgPicture.asset('assets/icons/audio_4.svg'),
                                      onTap: () {
                                        setState(() {
                                          nextAudio();
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          AppValue.vSpaceMedium,
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: AppValue.widths*0.16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/cck.svg'),
                                      AppValue.vSpace(5),
                                      WidgetText(
                                        title: 'Lặp chương',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: COLORS.WHITE
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      autoNext = !autoNext;
                                    });
                                    shareLocal.putBools(PreferencesKey.AUTO_NEXT_AUDIO,autoNext);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/autonext.svg',color: autoNext ? COLORS.PRIMARY_COLOR : COLORS.WHITE,),
                                      AppValue.vSpace(5),
                                      WidgetText(
                                        title: 'Tự sang chương',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: autoNext ? COLORS.PRIMARY_COLOR : COLORS.WHITE
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      WidgetText(
                                        title: '${speed[indexSpeed].toString()}x',
                                        style: AppStyle.DEFAULT_20.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: COLORS.WHITE
                                        ),
                                      ),
                                      WidgetText(
                                        title: 'Tốc độ đọc',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: COLORS.WHITE
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return  ModalSheetBookSame(id: dataBook.book!.Id.toString());
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/hiensachsame.png',height: 20,width: 20,),
                        AppValue.vSpace(5),
                        Container(
                          height: 2,
                          width: AppValue.widths*0.25,
                          decoration: BoxDecoration(
                              color: COLORS.PRIMARY_COLOR.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        AppValue.vSpace(15)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
        thumbShape: const RoundSliderThumbShape(disabledThumbRadius: 1.2, enabledThumbRadius: 7));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          SliderTheme(
            data: _sliderThemeData.copyWith(
              activeTrackColor: COLORS.PRIMARY_COLOR,
              inactiveTrackColor: Colors.white,
              valueIndicatorColor: Colors.white,
              thumbColor: COLORS.PRIMARY_COLOR,
              overlayColor: Colors.transparent,
            ),
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(), widget.duration.inMilliseconds.toDouble()),
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
            bottom: -3.0,
            child: Text(
                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                    .firstMatch("${widget.duration}")
                    ?.group(1) ??
                    '${widget.duration}',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500)),
          ),
          Positioned(
            left: 24.0,
            bottom: -3.0,
            child: Text(
                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                    .firstMatch("$_remaining")
                    ?.group(1) ??
                    '$_remaining',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  // Duration startTime = Duration();
  Duration get _remaining => widget.position;
}
//
// class HiddenThumbComponentShape extends SliderComponentShape {
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;
//
//   @override
//   void paint(
//       PaintingContext context,
//       Offset center, {
//         required Animation<double> activationAnimation,
//         required Animation<double> enableAnimation,
//         required bool isDiscrete,
//         required TextPainter labelPainter,
//         required RenderBox parentBox,
//         required SliderThemeData sliderTheme,
//         required TextDirection textDirection,
//         required double value,
//         required double textScaleFactor,
//         required Size sizeWithOverflow,
//       }) {}
// }
