import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
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
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      );
    } else if (_retrying) {
      // 如果正在重试加载视频，不显示加载中的进度条
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
