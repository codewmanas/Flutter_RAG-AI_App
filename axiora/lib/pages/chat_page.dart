import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widgets/answer_section.dart';
import 'package:myapp/widgets/sidebar.dart';
import 'package:myapp/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          const SizedBox(width: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question,
                        style:TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          
                        )
                        ),
                        SizedBox(height: 24),
                        SourcesSection(),
                        SizedBox(height: 24),
                        AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          Placeholder(
            strokeWidth: 0,
            color: AppColors.background,
          ),

        ],
      ),
    );
  }
}
