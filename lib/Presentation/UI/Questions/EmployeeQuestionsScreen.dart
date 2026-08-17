import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:speech_to_text/speech_to_text.dart';


import '../../../Data/Models/QuestionsModel.dart';
import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/Questions/QuestionsService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class EmployeeQuestionsScreen extends ConsumerStatefulWidget {
  const EmployeeQuestionsScreen({super.key});

  @override
  ConsumerState<EmployeeQuestionsScreen> createState() =>
      _EmployeeQuestionsScreenState();
}

class _EmployeeQuestionsScreenState
    extends ConsumerState<EmployeeQuestionsScreen> {
  String _searchQuery = "";
  int _selectedFilterIndex = 0; // 0: All, 1: Answered, 2: Pending
  final TextEditingController _searchController = TextEditingController();

  /// Check if the currently logged-in employee is authorized to answer questions.
  /// Only AG0032 and AG0034 are permitted.
  bool _isAuthorizedToAnswer(WidgetRef ref) {
    final user = ref.watch(sharedUtilityProvider).getUser();
    final empId = user?.empId?.toString().toUpperCase().trim() ?? '';
    return empId == "AG0032" || empId == "AG0034";
  }

  String _formatDateTime(dynamic raw) {
    if (raw == null ||
        raw.toString().trim().isEmpty ||
        raw.toString().trim() == "null") {
      return "";
    }
    try {
      DateTime dt = DateTime.parse(raw.toString()).toLocal();
      const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"
      ];
      String month = months[dt.month - 1];
      int hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
      String minute = dt.minute.toString().padLeft(2, '0');
      String period = dt.hour >= 12 ? "PM" : "AM";
      return "${dt.day} $month ${dt.year}, $hour:$minute $period";
    } catch (_) {
      return raw.toString().replaceAll("T", " ").split('.').first;
    }
  }

  void _openAnswerSheet(QuestionItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AnswerBottomSheetWidget(
        item: item,
        onAnswerSubmitted: () {
          ref.invalidate(employeeQuestionsListProvider);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool canAnswer = _isAuthorizedToAnswer(ref);
    final questionsAsync = ref.watch(employeeQuestionsListProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          "Questions & Answers",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: primaryColorDark,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
            tooltip: "Refresh",
            onPressed: () => ref.invalidate(employeeQuestionsListProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColorDark,
        elevation: 3,
        icon: const Icon(Icons.mic_rounded, color: Colors.white, size: 22),
        label: const Text(
          "Ask Question",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        onPressed: () {
          context.push('/voice_question').then((_) {
            ref.invalidate(employeeQuestionsListProvider);
          });
        },
      ),
      body: Column(
        children: [


          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Column(
              children: [
                // Modern Search Input
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4F8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val.trim().toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search questions, answers, names, roles...",
                      hintStyle: TextStyle(
                        fontSize: Adaptive.sp(12),
                        color: Colors.blueGrey.shade400,
                      ),
                      prefixIcon: const Icon(Icons.search_rounded,
                          color: primaryColorDark),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.cancel_rounded,
                                  color: Colors.grey),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = "";
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Filter Tabs
                Row(
                  children: [
                    _buildFilterChip("All Questions", 0),
                    const SizedBox(width: 8),
                    _buildFilterChip("Answered", 1),
                    const SizedBox(width: 8),
                    _buildFilterChip("Awaiting Response", 2),
                  ],
                ),
              ],
            ),
          ),

          // Main Questions List
          Expanded(
            child: questionsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline_rounded,
                          size: 54, color: Colors.red.shade400),
                      const SizedBox(height: 14),
                      Text(
                        "Unable to load questions",
                        style: TextStyle(
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "$err",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Adaptive.sp(11),
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColorDark,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        label: const Text("Try Again",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            ref.invalidate(employeeQuestionsListProvider),
                      ),
                    ],
                  ),
                ),
              ),
              data: (items) {
                // Filter items by search query and category
                var filtered = items.where((item) {
                  final q = (item.question ?? "").toString().toLowerCase();
                  final a = (item.answer ?? "").toString().toLowerCase();
                  final name = item.displayName.toLowerCase();
                  final role = item.displayRole.toLowerCase();

                  final matchesSearch = _searchQuery.isEmpty ||
                      q.contains(_searchQuery) ||
                      a.contains(_searchQuery) ||
                      name.contains(_searchQuery) ||
                      role.contains(_searchQuery);

                  if (!matchesSearch) return false;

                  if (_selectedFilterIndex == 1) {
                    return item.hasAnswer;
                  } else if (_selectedFilterIndex == 2) {
                    return !item.hasAnswer;
                  }
                  return true;
                }).toList();

                if (filtered.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(employeeQuestionsListProvider);
                    },
                    child: ListView(
                      children: [
                        SizedBox(height: Adaptive.sh(14)),
                        Icon(Icons.chat_bubble_outline_rounded,
                            size: 64, color: Colors.blueGrey.shade200),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            items.isEmpty
                                ? "No questions posted yet"
                                : "No matching questions found",
                            style: TextStyle(
                              fontSize: Adaptive.sp(14),
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Tap 'Ask Question' below to submit a question.",
                            style: TextStyle(
                              fontSize: Adaptive.sp(11),
                              color: Colors.blueGrey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(employeeQuestionsListProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      return _buildQuestionCard(item, canAnswer);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final bool isSelected = _selectedFilterIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilterIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? primaryColorDark : const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColorDark : const Color(0xFFDDE3EA),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: Adaptive.sp(11),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            color: isSelected ? Colors.white : Colors.blueGrey.shade800,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(QuestionItem item, bool canAnswer) {
    String initial = item.displayName.isNotEmpty
        ? item.displayName.substring(0, 1).toUpperCase()
        : "E";

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE8EEF5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Header Row (Name + Role + Status Pill)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // User Avatar with Initial
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, primaryColorDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      initial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Name and Role/Department
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.displayName,
                        style: TextStyle(
                          fontSize: Adaptive.sp(13),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      if (item.displayRole.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBF3FC),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.displayRole,
                            style: TextStyle(
                              fontSize: Adaptive.sp(9.5),
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1E6091),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Status Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: item.hasAnswer
                        ? const Color(0xFFE8F8F0)
                        : const Color(0xFFFFF4E5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: item.hasAnswer
                          ? const Color(0xFFA3E6C5)
                          : const Color(0xFFFFD199),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.hasAnswer
                            ? Icons.check_circle_rounded
                            : Icons.hourglass_top_rounded,
                        size: 13,
                        color: item.hasAnswer
                            ? const Color(0xFF15803D)
                            : const Color(0xFFB45309),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.hasAnswer ? "Answered" : "Awaiting Response",
                        style: TextStyle(
                          fontSize: Adaptive.sp(9.5),
                          fontWeight: FontWeight.bold,
                          color: item.hasAnswer
                              ? const Color(0xFF15803D)
                              : const Color(0xFFB45309),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Question Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        margin: const EdgeInsets.only(top: 1),
                        decoration: BoxDecoration(
                          color: primaryColorDark,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "Q",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "${item.question}",
                          style: TextStyle(
                            fontSize: Adaptive.sp(13),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0F172A),
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (item.createdAt != null &&
                      "${item.createdAt}".trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded,
                            size: 12, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          _formatDateTime(item.createdAt),
                          style: TextStyle(
                            fontSize: Adaptive.sp(9),
                            color: Colors.blueGrey.shade400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Answer Container (if answered)
            if (item.hasAnswer) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF16A34A),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "A",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.answeredBy != null &&
                                  "${item.answeredBy}".trim().isNotEmpty &&
                                  "${item.answeredBy}".trim() != "null"
                              ? "Response from ${item.answeredBy}"
                              : "Official Response",
                          style: TextStyle(
                            fontSize: Adaptive.sp(11),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF166534),
                          ),
                        ),
                        const Spacer(),
                        if (item.answeredAt != null &&
                            "${item.answeredAt}".trim().isNotEmpty &&
                            "${item.answeredAt}".trim() != "null")
                          Text(
                            _formatDateTime(item.answeredAt),
                            style: TextStyle(
                              fontSize: Adaptive.sp(8.5),
                              color: const Color(0xFF15803D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        "${item.answer}",
                        style: TextStyle(
                          fontSize: Adaptive.sp(12.5),
                          color: const Color(0xFF1E293B),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Action Button: ONLY for AG0032 and AG0034
            if (canAnswer) ...[
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: item.hasAnswer
                          ? Colors.blueGrey.shade700
                          : primaryColorDark,
                      foregroundColor: Colors.white,
                      elevation: 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(
                      item.hasAnswer ? Icons.edit_note_rounded : Icons.reply_rounded,
                      size: 18,
                    ),
                    label: Text(
                      item.hasAnswer ? "Edit Answer" : "Give Answer",
                      style: TextStyle(
                        fontSize: Adaptive.sp(11),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => _openAnswerSheet(item),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Dedicated Bottom Sheet with Speech-To-Text Voice Recording & Text input for giving answers
class _AnswerBottomSheetWidget extends StatefulWidget {
  final QuestionItem item;
  final VoidCallback onAnswerSubmitted;

  const _AnswerBottomSheetWidget({
    required this.item,
    required this.onAnswerSubmitted,
  });

  @override
  State<_AnswerBottomSheetWidget> createState() =>
      _AnswerBottomSheetWidgetState();
}

class _AnswerBottomSheetWidgetState extends State<_AnswerBottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late TextEditingController _answerController;
  final _formKey = GlobalKey<FormState>();

  final SpeechToText _speechToText = SpeechToText();
  bool _isSpeechInitialized = false;
  bool _isListening = false;
  bool _isSubmitting = false;
  String _speechStatus = "Tap mic to speak";

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController(
      text: widget.item.answer != null &&
              "${widget.item.answer}".trim() != "null"
          ? "${widget.item.answer}"
          : "",
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.28).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.reverse();
      } else if (status == AnimationStatus.dismissed && _isListening) {
        _pulseController.forward();
      }
    });

    _initSpeech();
  }

  Future<void> _initSpeech() async {
    try {
      bool available = await _speechToText.initialize(
        onError: (err) {
          if (mounted) {
            setState(() {
              _isListening = false;
              _speechStatus = "Microphone error: ${err.errorMsg}";
            });
            _pulseController.stop();
          }
        },
        onStatus: (status) {
          if (!mounted) return;
          if (status == 'listening') {
            setState(() {
              _isListening = true;
              _speechStatus = "Listening... Speak your answer";
            });
            _pulseController.forward();
          } else if (status == 'notListening' || status == 'done') {
            setState(() {
              _isListening = false;
              _speechStatus = "Tap mic to speak";
            });
            _pulseController.stop();
          }
        },
        debugLogging: false,
      );

      if (mounted) {
        setState(() {
          _isSpeechInitialized = available;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isSpeechInitialized = false;
        });
      }
    }
  }

  void _toggleListening() async {
    if (!_isSpeechInitialized) {
      await _initSpeech();
    }

    if (_isListening) {
      await _speechToText.stop();
      setState(() {
        _isListening = false;
        _speechStatus = "Tap mic to speak";
      });
      _pulseController.stop();
    } else {
      String previousText = _answerController.text.trim();
      setState(() {
        _isListening = true;
        _speechStatus = "Listening... Speak now";
      });
      _pulseController.forward();

      await _speechToText.listen(
        onResult: (result) {
          if (mounted) {
            setState(() {
              if (previousText.isEmpty) {
                _answerController.text = result.recognizedWords;
              } else {
                _answerController.text = "$previousText ${result.recognizedWords}";
              }
              _answerController.selection = TextSelection.fromPosition(
                TextPosition(offset: _answerController.text.length),
              );
            });
          }
        },
        listenMode: ListenMode.dictation,
      );
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _answerController.dispose();
    try {
      _speechToText.stop();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.rate_review_rounded,
                            color: primaryColorDark, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.item.hasAnswer ? "Edit Response" : "Provide Response",
                        style: TextStyle(
                          fontSize: Adaptive.sp(15),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Question Preview Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Question from ${widget.item.displayName}:",
                          style: TextStyle(
                            fontSize: Adaptive.sp(10.5),
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        if (widget.item.displayRole.isNotEmpty) ...[
                          const SizedBox(width: 6),
                          Text(
                            "(${widget.item.displayRole})",
                            style: TextStyle(
                              fontSize: Adaptive.sp(9.5),
                              color: Colors.blueGrey.shade500,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${widget.item.question}",
                      style: TextStyle(
                        fontSize: Adaptive.sp(12),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Answer Label & Mic Button Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Answer *",
                    style: TextStyle(
                      fontSize: Adaptive.sp(12.5),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  // Animated Mic Button
                  InkWell(
                    onTap: _toggleListening,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: _isListening
                            ? Colors.red.shade50
                            : const Color(0xFFE8F1F5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _isListening
                              ? Colors.red.shade400
                              : primaryColorDark.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ScaleTransition(
                            scale: _isListening
                                ? _pulseAnimation
                                : const AlwaysStoppedAnimation(1.0),
                            child: Icon(
                              _isListening
                                  ? Icons.mic_rounded
                                  : Icons.mic_none_rounded,
                              size: 16,
                              color: _isListening
                                  ? Colors.red.shade700
                                  : primaryColorDark,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _isListening ? "Listening..." : "Speak Answer",
                            style: TextStyle(
                              fontSize: Adaptive.sp(10),
                              fontWeight: FontWeight.bold,
                              color: _isListening
                                  ? Colors.red.shade700
                                  : primaryColorDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Answer Input Field
              TextFormField(
                controller: _answerController,
                maxLines: 5,
                style: TextStyle(fontSize: Adaptive.sp(12.5), height: 1.4),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please provide an answer before submitting";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Type or use the microphone to speak your answer...",
                  hintStyle: TextStyle(
                    fontSize: Adaptive.sp(11.5),
                    color: Colors.blueGrey.shade300,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFBFC),
                  contentPadding: const EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: primaryColorDark, width: 2),
                  ),
                ),
              ),

              if (_isListening) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _speechStatus,
                      style: TextStyle(
                        fontSize: Adaptive.sp(10),
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),

              // Submit Button
              Consumer(
                builder: (context, ref, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColorDark,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: _isSubmitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.send_rounded, size: 18),
                      label: Text(
                        _isSubmitting
                            ? "Submitting Response..."
                            : "Submit Official Answer",
                        style: TextStyle(
                          fontSize: Adaptive.sp(13.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _isSubmitting
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;

                              if (_isListening) {
                                await _speechToText.stop();
                              }

                              setState(() {
                                _isSubmitting = true;
                              });

                              try {
                                final res = await submitQuestionAnswer(
                                  ref,
                                  questionId: widget.item.id,
                                  answer: _answerController.text.trim(),
                                );

                                if (mounted) {
                                  Navigator.pop(context);
                                }

                                String msg = res['message'] != null
                                    ? "${res['message']}"
                                    : "Answer submitted successfully!";
                                Fluttertoast.showToast(msg: msg);

                                widget.onAnswerSubmitted();
                              } catch (e) {
                                if (mounted) {
                                  setState(() {
                                    _isSubmitting = false;
                                  });
                                }
                                Fluttertoast.showToast(
                                    msg: "Error submitting answer: $e");
                              }
                            },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
