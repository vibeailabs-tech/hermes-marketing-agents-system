#!/usr/bin/env bash
# Cài đội agent marketing thành một profile Hermes riêng, chỉ chứa 6 skill marketing
# và danh tính "Trưởng phòng Marketing AI". Chạy lại script để cập nhật sau khi sửa skill.
#
#   bash 07-hermes/install.sh            # profile tên "marketing"
#   bash 07-hermes/install.sh ten-khac   # đặt tên profile khác
set -euo pipefail

PROFILE="${1:-marketing}"
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
DIST="$HERE/dist"
SKILLS=(00-marketing-orchestrator 01-content-research 02-marketing-copywriting 03-marketing-strategy 04-data-visualization 05-landing-page-audit)

ask() { [ -t 0 ] && read -r -p "$1 [y/N] " reply && [[ "$reply" =~ ^[yY] ]]; }

command -v hermes >/dev/null || { echo "Không tìm thấy lệnh hermes. Cài Hermes Agent trước."; exit 1; }

echo "==> Đóng gói distribution vào $DIST"
rm -rf "$DIST"
mkdir -p "$DIST/skills/marketing"
for d in "${SKILLS[@]}"; do
  [ -f "$ROOT/$d/SKILL.md" ] || { echo "Thiếu $ROOT/$d/SKILL.md"; exit 1; }
  # Bỏ tiền tố số để tên thư mục khớp với trường name trong SKILL.md
  cp -R "$ROOT/$d" "$DIST/skills/marketing/${d#??-}"
done
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

  PROFILE_HOME="$(hermes -p "$PROFILE" config path | xargs dirname)"
  DEFAULT_ENV="$(hermes -p default config env-path)"
  if [ -f "$DEFAULT_ENV" ] && ask "Dùng chung API key (.env) của profile mặc định cho '$PROFILE'?"; then
    cp "$DEFAULT_ENV" "$PROFILE_HOME/.env" && chmod 600 "$PROFILE_HOME/.env"
    echo "    Đã sao chép .env (chỉ trên máy này, quyền 600)."
  else
    echo "    Bỏ qua. Cấu hình model/API key sau bằng: hermes -p $PROFILE model"
  fi
fi

echo "==> Cấu hình giao việc cho subagent"
hermes -p "$PROFILE" config set delegation.max_concurrent_children 5 >/dev/null
hermes -p "$PROFILE" config set delegation.max_spawn_depth 1 >/dev/null

if ask "Đặt '$PROFILE' làm profile mặc định (mọi lệnh hermes sẽ chạy đội marketing)?"; then
  hermes profile use "$PROFILE"
fi

echo
echo "Xong. Kiểm tra skill:  hermes -p $PROFILE skills list"
echo "Bắt đầu làm việc:     hermes -p $PROFILE"
echo "Quay về Hermes gốc:   hermes profile use default"
