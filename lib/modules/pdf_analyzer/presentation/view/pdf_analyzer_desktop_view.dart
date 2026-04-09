import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_bloc.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_event.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_state.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/neon_loader.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class PdfAnalyzerDesktopView extends StatefulWidget {
  const PdfAnalyzerDesktopView({super.key});

  @override
  State<PdfAnalyzerDesktopView> createState() =>
      _PdfAnalyzerDesktopViewState();
}

class _PdfAnalyzerDesktopViewState extends State<PdfAnalyzerDesktopView> {
  List<PlatformFile> _selectedFiles = [];
  final ScrollController _scrollController = ScrollController();

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
      withData: true,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _selectedFiles = result.files);
    }
  }

  void _uploadFiles(BuildContext context) {
    if (_selectedFiles.isEmpty) return;
    context
        .read<PdfAnalyzerBloc>()
        .add(UploadPdfsEvent(files: _selectedFiles));
  }

  void _sendQuestion(BuildContext context) {
    final bloc = context.read<PdfAnalyzerBloc>();
    final text = bloc.questionController.text.trim();
    if (text.isEmpty) return;

    bloc.add(AskQuestionEvent(question: text));
    bloc.questionController.clear();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdfAnalyzerBloc, PdfAnalyzerState>(
      listener: (context, state) {
        if (state is PdfUploadSuccessState) {
          setState(() => _selectedFiles = []);
        }
        if (state is PdfAnswerSuccessState || state is PdfAnswerFailureState) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        final bloc = context.read<PdfAnalyzerBloc>();

        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: OmniSuiteColors.white),
              onPressed: () => context.go(AppLink.dashboard),
            ),
            centerTitle: true,
            title: const Text(
              'PDF ANALYZER',
              style: OmniSuiteTextStyle.subheadingH4,
            ),
          ),
          body: bloc.isPdfUploaded
              ? _buildChatView(context, state, bloc)
              : _buildUploadView(context, state),
        );
      },
    );
  }

  Widget _buildUploadView(BuildContext context, PdfAnalyzerState state) {
    final isUploading = state is PdfUploadingState;

    return Center(
      child: Container(
        width: UIHelpers.screenWidth(context) * 0.5,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: OmniSuiteColors.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: OmniSuiteColors.borderGreen, width: 1),
          boxShadow: [
            BoxShadow(
              color: OmniSuiteColors.neonGreen.withOpacity(0.15),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: isUploading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100, width: 100, child: NeonLoader()),
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    'Processing your PDFs...',
                    style: OmniSuiteTextStyle.normal
                        .copyWith(color: OmniSuiteColors.textSecondary),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.picture_as_pdf_rounded,
                    size: 64,
                    color: OmniSuiteColors.neonGreen.withOpacity(0.8),
                  ),
                  UIHelpers.verticalSpaceMedium,
                  const Text(
                    'Upload PDF Files',
                    style: OmniSuiteTextStyle.subheadingH5,
                  ),
                  UIHelpers.verticalSpaceSmall,
                  Text(
                    'Select one or more PDF files to analyze',
                    style: OmniSuiteTextStyle.small
                        .copyWith(color: OmniSuiteColors.textSecondary),
                  ),
                  UIHelpers.verticalSpaceLarge,
                  _buildPickButton(),
                  if (_selectedFiles.isNotEmpty) ...[
                    UIHelpers.verticalSpaceMedium,
                    _buildFileList(),
                    UIHelpers.verticalSpaceMedium,
                    _buildUploadButton(context),
                  ],
                  if (state is PdfUploadFailureState) ...[
                    UIHelpers.verticalSpaceMedium,
                    _buildErrorBanner(state.message),
                  ],
                ],
              ),
      ),
    );
  }

  Widget _buildPickButton() {
    return OutlinedButton.icon(
      onPressed: _pickFiles,
      icon: const Icon(Icons.add, color: OmniSuiteColors.neonGreen),
      label: Text(
        _selectedFiles.isEmpty ? 'Choose PDF Files' : 'Change Files',
        style: OmniSuiteTextStyle.small
            .copyWith(color: OmniSuiteColors.neonGreen),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: OmniSuiteColors.borderGreen),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    );
  }

  Widget _buildFileList() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 160),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _selectedFiles.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (_, i) {
          final file = _selectedFiles[i];
          final sizeKb = (file.size / 1024).toStringAsFixed(1);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: OmniSuiteColors.bgBlack.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.picture_as_pdf,
                    color: OmniSuiteColors.neonGreen, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    file.name,
                    style: OmniSuiteTextStyle.small
                        .copyWith(color: OmniSuiteColors.textPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '$sizeKb KB',
                  style: OmniSuiteTextStyle.mediumHint
                      .copyWith(color: OmniSuiteColors.textSecondary),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _uploadFiles(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: OmniSuiteColors.neonGreen,
          foregroundColor: OmniSuiteColors.bgBlack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          'Upload & Process (${_selectedFiles.length} file${_selectedFiles.length > 1 ? 's' : ''})',
          style: OmniSuiteTextStyle.small.copyWith(
            color: OmniSuiteColors.bgBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildChatView(
    BuildContext context,
    PdfAnalyzerState state,
    PdfAnalyzerBloc bloc,
  ) {
    final isAsking = state is PdfAskingState;

    return Row(
      children: [
        _buildSidebar(context, bloc),
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildMessageList(bloc, isAsking)),
              _buildQuestionInput(context, state, bloc),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context, PdfAnalyzerBloc bloc) {
    return Container(
      width: UIHelpers.screenWidth(context) * 0.22,
      decoration: const BoxDecoration(
        color: OmniSuiteColors.cardColor,
        border: Border(
          right: BorderSide(color: OmniSuiteColors.borderGreen, width: 0.5),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description,
                  color: OmniSuiteColors.neonGreen.withOpacity(0.8), size: 20),
              const SizedBox(width: 8),
              Text(
                'Uploaded PDFs',
                style: OmniSuiteTextStyle.small.copyWith(
                  color: OmniSuiteColors.neonGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          UIHelpers.verticalSpaceSmall,
          const Divider(color: OmniSuiteColors.borderGreen, height: 1),
          UIHelpers.verticalSpaceSmall,
          Expanded(
            child: ListView.separated(
              itemCount: bloc.uploadedFileNames.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (_, i) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: OmniSuiteColors.bgBlack.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.picture_as_pdf,
                        color: OmniSuiteColors.textSecondary, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        bloc.uploadedFileNames[i],
                        style: OmniSuiteTextStyle.mediumHint
                            .copyWith(color: OmniSuiteColors.textPrimary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          UIHelpers.verticalSpaceSmall,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.read<PdfAnalyzerBloc>().add(ResetPdfAnalyzerEvent());
              },
              icon: const Icon(Icons.refresh,
                  color: OmniSuiteColors.neonGreen, size: 16),
              label: Text(
                'Upload New',
                style: OmniSuiteTextStyle.mediumHint
                    .copyWith(color: OmniSuiteColors.neonGreen),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: OmniSuiteColors.borderGreen),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(PdfAnalyzerBloc bloc, bool isAsking) {
    if (bloc.conversations.isEmpty && !isAsking) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat_bubble_outline,
                size: 48, color: OmniSuiteColors.neonGreen.withOpacity(0.3)),
            UIHelpers.verticalSpaceSmall,
            Text(
              'Ask a question about your PDFs',
              style: OmniSuiteTextStyle.normal
                  .copyWith(color: OmniSuiteColors.textSecondary),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      itemCount: bloc.conversations.length + (isAsking ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == bloc.conversations.length && isAsking) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   SizedBox(
                    width: 40,
                    height: 40,
                    child: NeonLoader(),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Thinking...',
                    style: OmniSuiteTextStyle.small
                        .copyWith(color: OmniSuiteColors.textSecondary),
                  ),
                ],
              ),
            ),
          );
        }

        final msg = bloc.conversations[index];
        return _buildChatBubble(msg, context);
      },
    );
  }

  Widget _buildChatBubble(ChatMessage msg, BuildContext context) {
    final isUser = msg.isUser;
    final maxWidth = UIHelpers.screenWidth(context) * 0.45;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              radius: 16,
              backgroundColor: OmniSuiteColors.neonGreen.withOpacity(0.15),
              child: const Icon(Icons.smart_toy,
                  color: OmniSuiteColors.neonGreen, size: 18),
            ),
          if (!isUser) const SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isUser
                  ? OmniSuiteColors.neonGreen.withOpacity(0.12)
                  : OmniSuiteColors.cardColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isUser ? 16 : 4),
                bottomRight: Radius.circular(isUser ? 4 : 16),
              ),
              border: Border.all(
                color: isUser
                    ? OmniSuiteColors.neonGreen.withOpacity(0.3)
                    : OmniSuiteColors.borderGreen.withOpacity(0.3),
                width: 0.5,
              ),
            ),
            child: SelectableText(
              msg.text,
              style: OmniSuiteTextStyle.small.copyWith(
                color: OmniSuiteColors.textPrimary,
                height: 1.5,
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 10),
          if (isUser)
            CircleAvatar(
              radius: 16,
              backgroundColor: OmniSuiteColors.neonGreen.withOpacity(0.15),
              child: const Icon(Icons.person,
                  color: OmniSuiteColors.neonGreen, size: 18),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionInput(
    BuildContext context,
    PdfAnalyzerState state,
    PdfAnalyzerBloc bloc,
  ) {
    final isAsking = state is PdfAskingState;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: OmniSuiteColors.borderGreen, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: bloc.questionController,
              enabled: !isAsking,
              onSubmitted: isAsking ? null : (_) => _sendQuestion(context),
              style: OmniSuiteTextStyle.small
                  .copyWith(color: OmniSuiteColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Ask a question about your PDFs...',
                hintStyle: OmniSuiteTextStyle.small
                    .copyWith(color: OmniSuiteColors.textSecondary),
                filled: true,
                fillColor: OmniSuiteColors.cardColor,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      color: OmniSuiteColors.borderGreen, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      color: OmniSuiteColors.borderGreen, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      color: OmniSuiteColors.neonGreen, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: OmniSuiteColors.borderGreen.withOpacity(0.3),
                      width: 0.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Material(
            color: isAsking
                ? OmniSuiteColors.neonGreen.withOpacity(0.3)
                : OmniSuiteColors.neonGreen,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: isAsking ? null : () => _sendQuestion(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.send_rounded,
                  color: isAsking
                      ? OmniSuiteColors.textSecondary
                      : OmniSuiteColors.bgBlack,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: OmniSuiteTextStyle.mediumHint
                  .copyWith(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
