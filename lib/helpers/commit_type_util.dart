class CommitTypeUtil {
  static String determineCommitType(String commitMessage) {
    if (commitMessage.toLowerCase().contains('feat')) {
      return 'FEAT';
    } else if (commitMessage.toLowerCase().contains('ui')) {
      return 'UI';
    } else if (commitMessage.toLowerCase().contains('tada')) {
      return 'TADA';
    } else if (commitMessage.toLowerCase().contains('fix')) {
      return 'FIX';
    } else if (commitMessage.toLowerCase().contains('add')) {
      return 'ADD';
    } else if (commitMessage.toLowerCase().contains('config')) {
      return 'CONFIG';
    } else if (commitMessage.toLowerCase().contains('auth')) {
      return 'AUTH';
    } else if (commitMessage.toLowerCase().contains('resources')) {
      return 'RESOURCES';
    } else if (commitMessage.toLowerCase().contains('patch')) {
      return 'PATCH';
    } else {
      return 'DEFAULT';
    }
  }
}
