#!/bin/bash

# macOS 开发环境设置脚本
set -e  # 遇到错误立即退出

echo "🚀 开始设置 macOS 开发环境..."

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# 检查 Homebrew 是否安装
check_brew() {
    if ! command -v brew &> /dev/null; then
        log_error "Homebrew 未安装，请先安装 Homebrew"
        log_info "安装命令: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    log_success "Homebrew 已安装"
}

# 第一部分：安装基础软件
install_packages() {
    log_info "开始安装基础软件包..."
    
    # 安装字体仓库
    # brew tap homebrew/cask-fonts
    
    # 安装基础工具
    brew install git nvim fish peco ripgrep eza lazygit starship
    
    # 可选工具（取消注释按需安装）
    # brew install delta zellij jq pyenv
    
    log_success "基础软件包安装完成"
}

# 将 fish 添加到合法 shells
setup_fish_shell() {
    log_info "设置 Fish shell..."
    
    local fish_path=$(which fish)
    
    if [ -z "$fish_path" ]; then
        log_error "未找到 fish，请先安装 fish"
        exit 1
    fi
    
    # 检查是否已在合法 shells 中
    if ! grep -q "$fish_path" /etc/shells; then
        log_info "将 fish 添加到 /etc/shells"
        echo "$fish_path" | sudo tee -a /etc/shells
        log_success "fish 已添加到合法 shells"
    else
        log_success "fish 已在合法 shells 中"
    fi
}

# 安装 fisher 和插件
setup_fish_plugins() {
    log_info "设置 Fish shell 插件..."
    
    # 创建临时脚本来在 fish 中执行
    cat > /tmp/setup_fish.fish << 'EOF'
#!/usr/bin/fish

set -gx FISH_SETUP_SUCCESS 0

echo "🐟 开始在 Fish shell 中设置环境..."

# 安装 fisher
if not functions -q fisher
    echo "安装 fisher..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# 验证 fisher 安装
if functions -q fisher
    echo "✅ fisher 安装成功"
    
    # 安装插件（可选）
    # fisher install jethrokuan/z
    # fisher install jorgebucaran/nvm.fish
    
    set -gx FISH_SETUP_SUCCESS 1
else
    echo "❌ fisher 安装失败"
    set -gx FISH_SETUP_SUCCESS 0
end
EOF
    
    # 在 fish 中执行设置脚本
    fish /tmp/setup_fish.fish
    
    # 清理临时文件
    rm -f /tmp/setup_fish.fish
    
    if [ "$FISH_SETUP_SUCCESS" -eq 1 ]; then
        log_success "Fish shell 插件设置完成"
    else
        log_warning "Fish shell 插件设置可能存在问题"
    fi
}

# 更改默认 shell（可选）
change_default_shell() {
    log_info "当前默认 shell: $SHELL"
    
    local fish_path=$(which fish)
    
    # 确认是否更改默认 shell
    read -p "是否将默认 shell 更改为 fish? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        log_info "更改默认 shell 为 fish..."
        if chsh -s "$fish_path"; then
            log_success "默认 shell 已更改为 fish"
            log_warning "请重新登录或重启终端以使更改生效"
        else
            log_error "更改默认 shell 失败"
        fi
    else
        log_info "保持当前默认 shell"
        log_info "要手动启动 fish，请输入: fish"
    fi
}

# 显示完成信息
show_completion() {
    echo
    log_success "🎉 环境设置完成！"
    echo
    echo "📦 已安装的软件:"
    echo "   - Git, Neovim, Fish shell"
    echo "   - Peco, Ripgrep, eza, LazyGit, Starship"
    echo "   - Fisher (Fish shell 插件管理器)"
    echo
    echo "🚀 下一步操作:"
    echo "   1. 重新启动终端"
    echo "   2. 如果更改了默认 shell，会自动进入 fish"
    echo "   3. 如果没有更改默认 shell，可以输入 'fish' 启动"
    echo "   4. 配置 Starship 提示符: https://starship.rs/"
    echo
    echo "🔧 可选配置:"
    echo "   - 安装 nvm: fisher install jorgebucaran/nvm.fish"
    echo "   - 安装 z: fisher install jethrokuan/z"
    echo "   - 配置 Neovim: 参考 nvim-chad 或 lazyvim"
}

# 主函数
main() {
    log_info "开始 macOS 开发环境设置..."
    
    # 检查依赖
    check_brew
    
    # 安装软件包
    install_packages
    
    # 设置 fish shell
    setup_fish_shell
    
    # 设置 fish 插件
    setup_fish_plugins
    
    # 询问是否更改默认 shell
    change_default_shell
    
    # 显示完成信息
    show_completion
}

# 执行主函数
main "$@"