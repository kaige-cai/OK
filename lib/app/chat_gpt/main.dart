import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatGPTPage extends StatefulWidget {
  @override
  _ChatGPTPageState createState() => _ChatGPTPageState();
}

class _ChatGPTPageState extends State<ChatGPTPage> {
  TextEditingController _controller = TextEditingController();
  String _chatHistory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatGPT App')),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(child: Text(_chatHistory))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        InputDecoration(hintText: 'Type your message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    String userMessage = _controller.text;
    _controller.clear();

    // 发送用户消息给ChatGPT API并接收回复
    String response = await fetchChatGPTResponse(userMessage);

    setState(() {
      _chatHistory += 'You: $userMessage\n';
      _chatHistory += 'ChatGPT: $response\n';
    });
  }

  Future<String> fetchChatGPTResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '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',
      },
      body: '{"prompt": "$message"}',
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['choices'][0]['text'];
    } else {
      return 'Error: Unable to fetch response';
    }
  }
}
