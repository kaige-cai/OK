import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;

  const VideoItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  VideoItemState createState() => VideoItemState();
}

class VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  int _retryCount = 0;
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);
  bool _retrying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller.setLooping(true); // 将视频设置为循环播放
    _controller.setVolume(0.0); // 设置默认静音
    // 监听视频加载状态
    _controller.addListener(() {
      if (_controller.value.hasError && _retryCount < _maxRetries) {
        // 如果加载失败且重试次数未达到上限，则延迟一段时间后重试加载
        Future.delayed(_retryDelay, () {
          setState(() {
            _retryCount++;
            _retrying = true; // 设置重试标志
          });
          _controller =
              VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
                ..initialize().then((_) {
                  if (mounted) {
                    setState(() {
                      _retrying = false; // 重置重试标志
                    });
                  }
                });
        });
      }
    });

    await _controller.initialize();
    if (mounted) {
      setState(() {
        _retrying = false; // 初始化时重置重试标志
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child: VisibilityDetector(
          key: Key(widget.videoUrl),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction == 1.0) {
              _controller.play(); // 当视频进入视图时开始播放
            } else {
              _controller.pause(); // 当视频离开视图时暂停播放
            }
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
      );
    } else if (_retrying) {
      // 如果正在重试加载视频且重试时间不超过2秒，则显示 CircularProgressIndicator
      Future.delayed(const Duration(seconds: 1), () {
        if (_retrying) {
          setState(() {});
          return const Center(child: CircularProgressIndicator());
        }
      });
      return Container();
    } else if (_retryCount < _maxRetries) {
      // 如果视频未加载成功且未达到最大重试次数，则显示加载中的进度条
      return const Center(child: CircularProgressIndicator());
    } else {
      // 达到最大重试次数后，显示加载失败的提示
      return const Center(child: Text('加载视频失败'));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
