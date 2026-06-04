# Load google cloud sdk config for zsh
_google_cloud_sdk_dir="${HOMEBREW_PREFIX:-$(brew --prefix)}/share/google-cloud-sdk"
[[ -r "$_google_cloud_sdk_dir/path.zsh.inc" ]] && source "$_google_cloud_sdk_dir/path.zsh.inc"

# The next line enables auto completion for gcloud
[[ -r "$_google_cloud_sdk_dir/completion.zsh.inc" ]] && source "$_google_cloud_sdk_dir/completion.zsh.inc"
unset _google_cloud_sdk_dir
