import 'package:flutter/material.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';

enum DeletionStep {
  idle,
  removingAvatar,
  deletingData,
  schedulingDeletion,
  completed,
}

class DeleteProgressBottomSheet extends StatefulWidget {
  final AuthViewModel viewModel;
  const DeleteProgressBottomSheet({
    super.key,
    required this.viewModel,
  });

  @override
  State<DeleteProgressBottomSheet> createState() => _DeleteProgressBottomSheetState();
}

class _DeleteProgressBottomSheetState extends State<DeleteProgressBottomSheet> {
  DeletionStep _currentStep = DeletionStep.idle;

  @override
  void initState() {
    super.initState();
    _startDeletionProcess();
  }

  Future<void> _startDeletionProcess() async {
    setState(() => _currentStep = DeletionStep.removingAvatar);
    await widget.viewModel.deleteAvatar();

    setState(() => _currentStep = DeletionStep.deletingData);
    await widget.viewModel.softDeleteUserData();

    setState(() => _currentStep = DeletionStep.schedulingDeletion);
    await widget.viewModel.blockAccount();

    setState(() => _currentStep = DeletionStep.completed);

    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.dialogBackgroundColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deleting your account...',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          DeletionStepItem(
            label: 'Removing profile picture...',
            isCompleted: _currentStep.index > DeletionStep.removingAvatar.index,
            isActive: _currentStep == DeletionStep.removingAvatar,
          ),
          const SizedBox(height: 16),
          DeletionStepItem(
            label: 'Deleting user data...',
            isCompleted: _currentStep.index > DeletionStep.deletingData.index,
            isActive: _currentStep == DeletionStep.deletingData,
          ),
          const SizedBox(height: 16),
          DeletionStepItem(
            label: 'Scheduling account removal...',
            isCompleted: _currentStep.index > DeletionStep.schedulingDeletion.index,
            isActive: _currentStep == DeletionStep.schedulingDeletion,
          ),
        ],
      ),
    );
  }
}

class DeletionStepItem extends StatelessWidget {
  final String label;
  final bool isCompleted;
  final bool isActive;

  const DeletionStepItem({
    super.key,
    required this.label,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor = isCompleted
        ? theme.colorScheme.primary
        : isActive
            ? theme.colorScheme.onSurface
            : theme.colorScheme.onSurfaceVariant;

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceOut,
                ),
                child: child,
              );
            },
            child: isCompleted
                ? Icon(
                    Icons.check_circle,
                    key: const ValueKey('check'),
                    color: Colors.green,
                    size: 24,
                  )
                : isActive
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          key: const ValueKey('spinner'),
                          strokeWidth: 2,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        key: const ValueKey('empty'),
                        color: theme.colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
