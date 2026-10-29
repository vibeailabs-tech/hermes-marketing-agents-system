#!/usr/bin/env bash
# Cài đội agent marketing vào Hermes Agent. Chạy trên máy/VPS (hoặc trong container) đang chạy Hermes.
#
#   bash 07-hermes/install.sh --current --only-marketing
#       Cài thẳng vào profile Hermes đang chạy (thường là VPS): thay SOUL.md, cài 6 skill,
#       gỡ bộ skill mặc định của Hermes để hệ thống chỉ làm marketing.
#   bash 07-hermes/install.sh --current
#       Như trên nhưng giữ lại bộ skill mặc định của Hermes.
#   bash 07-hermes/install.sh [ten-profile]
#       Tạo profile riêng (mặc định "marketing"), Hermes gốc giữ nguyên.
#
# Chạy lại script bất cứ lúc nào để cập nhật sau khi `git pull`.
set -euo pipefail

MODE=profile
PROFILE=marketing
ONLY_MARKETING=no
while [ $# -gt 0 ]; do
  case "$1" in
    --current) MODE=current ;;
    --only-marketing) ONLY_MARKETING=yes ;;
    -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
    -*) echo "Tuỳ chọn không hợp lệ: $1"; exit 1 ;;
    *) PROFILE="$1" ;;
  esac
  shift
done

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
SKILLS=(00-marketing-orchestrator 01-content-research 02-marketing-copywriting 03-marketing-strategy 04-data-visualization 05-landing-page-audit)

ask() { [ -t 0 ] && read -r -p "$1 [y/N] " reply && [[ "$reply" =~ ^[yY] ]]; }

command -v hermes >/dev/null || { echo "Không tìm thấy lệnh hermes. Chạy script trên máy/container đang chạy Hermes."; exit 1; }
for d in "${SKILLS[@]}"; do
  [ -f "$ROOT/$d/SKILL.md" ] || { echo "Thiếu $ROOT/$d/SKILL.md"; exit 1; }
done

# Bỏ tiền tố số để tên thư mục khớp với trường name trong SKILL.md
copy_skills() {
  mkdir -p "$1"
  for d in "${SKILLS[@]}"; do
    rm -rf "${1:?}/${d#??-}"
    cp -R "$ROOT/$d" "$1/${d#??-}"
  done
}

if [ "$MODE" = current ]; then
  HOME_DIR="$(dirname "$(hermes config path)")"
  echo "==> Cài vào profile đang chạy: $HOME_DIR"

  copy_skills "$HOME_DIR/skills/marketing"
  echo "    Đã cài 6 skill vào $HOME_DIR/skills/marketing/"

  if [ -f "$HOME_DIR/SOUL.md" ] && ! cmp -s "$HOME_DIR/SOUL.md" "$HERE/SOUL.md"; then
    BACKUP="$HOME_DIR/SOUL.md.bak-$(date +%Y%m%d-%H%M%S)"
    cp "$HOME_DIR/SOUL.md" "$BACKUP"
    echo "    Đã sao lưu SOUL.md cũ: $BACKUP"
  fi
  cp "$HERE/SOUL.md" "$HOME_DIR/SOUL.md"
  echo "    Đã thay SOUL.md (Trưởng phòng Marketing AI)"

  if [ "$ONLY_MARKETING" = yes ] || ask "Gỡ bộ skill mặc định của Hermes để chỉ còn skill marketing?"; then
    hermes skills opt-out --remove --yes
  fi
  TARGET=()
else
  DIST="$HERE/dist"
  echo "==> Đóng gói distribution vào $DIST"
  rm -rf "$DIST"
  copy_skills "$DIST/skills/marketing"
  cp "$HERE/SOUL.md" "$HERE/distribution.yaml" "$DIST/"
  printf 'Profile chỉ dùng skill marketing; không nạp bộ skill mặc định của Hermes.\n' > "$DIST/.no-bundled-skills"

  if hermes profile show "$PROFILE" >/dev/null 2>&1; then
    echo "==> Profile '$PROFILE' đã có, cập nhật skill và SOUL.md (giữ nguyên config, .env, bộ nhớ)"
    # Distribution không mang config.yaml nên --force chỉ thay SOUL.md và skill marketing.
    hermes profile install "$DIST" --name "$PROFILE" --force -y
  else
    echo "==> Tạo profile '$PROFILE' (không kèm bộ skill mặc định, model lấy từ profile hiện tại)"
    hermes profile create "$PROFILE" --no-skills \
      --description "Trưởng phòng marketing: điều phối nghiên cứu, chiến lược, viết nội dung, dashboard, audit landing page."
    hermes profile install "$DIST" --name "$PROFILE" --force -y

    PROFILE_HOME="$(dirname "$(hermes -p "$PROFILE" config path)")"
    DEFAULT_ENV="$(hermes -p default config env-path)"
    if [ -f "$DEFAULT_ENV" ] && ask "Dùng chung API key (.env) của profile mặc định cho '$PROFILE'?"; then
      cp "$DEFAULT_ENV" "$PROFILE_HOME/.env" && chmod 600 "$PROFILE_HOME/.env"
      echo "    Đã sao chép .env (quyền 600)."
    else
      echo "    Bỏ qua. Cấu hình model/API key sau bằng: hermes -p $PROFILE model"
    fi
  fi
  TARGET=(-p "$PROFILE")
fi

echo "==> Cấu hình giao việc cho subagent"
hermes "${TARGET[@]+"${TARGET[@]}"}" config set delegation.max_concurrent_children 5 >/dev/null
hermes "${TARGET[@]+"${TARGET[@]}"}" config set delegation.max_spawn_depth 1 >/dev/null

if [ "$MODE" = profile ] && ask "Đặt '$PROFILE' làm profile mặc định (mọi lệnh hermes sẽ chạy đội marketing)?"; then
  hermes profile use "$PROFILE"
fi

echo
echo "Xong. Kiểm tra skill:  hermes ${TARGET[*]+${TARGET[*]} }skills list | grep -i marketing"
echo "Mở phiên chat MỚI (trên Telegram/Discord/Slack gõ /new) để Hermes nạp SOUL.md mới."
echo "Nếu gateway không nhận skill mới:  hermes ${TARGET[*]+${TARGET[*]} }gateway restart"
