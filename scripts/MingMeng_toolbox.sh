#!/system/bin/sh
# 明梦工具箱 - 一键整合脚本（执行完毕自动删除自身）

# 获取当前脚本的真实路径（用于最后自删除）
SCRIPT_PATH="$(readlink -f "$0" 2>/dev/null || realpath "$0" 2>/dev/null || echo "$0")"

# 颜色 + 粗体
BOLD='\033[1m'
PURPLE='\033[0;35m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

INFO="${CYAN}[-]${NC}"
SUCCESS="${GREEN}[√]${NC}"
ERROR="${RED}[×]${NC}"
INPUT="${BOLD}${YELLOW}>>>${NC}"

show_menu() {
    clear
    echo "${BOLD}${PURPLE}╔════════════════════════════════════════╗${NC}"
    echo "${BOLD}${PURPLE}║   ${BOLD}${YELLOW}<<< Welcome to MingMeng Toolbox! >>>${PURPLE}   ║${NC}"
    echo "${BOLD}${PURPLE}╠════════════════════════════════════════╣${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}1.${NC} ${CYAN}林羽驱动 5.3${PURPLE}                     ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}2.${NC} ${CYAN}林羽内核${PURPLE}                         ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}3.${NC} ${CYAN}林羽过验证${PURPLE}                       ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}4.${NC} ${CYAN}清理下发${PURPLE}                         ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}5.${NC} ${CYAN}一键清理3（牛逼哥）${PURPLE}              ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}6.${NC} ${CYAN}随机改三角洲ID${PURPLE}                   ║${NC}"
    echo "${BOLD}${PURPLE}║${NC}  ${BOLD}${GREEN}7.${NC} ${RED}退出${PURPLE}                             ║${NC}"
    echo "${BOLD}${PURPLE}╚════════════════════════════════════════╝${NC}"
    echo -n "${INPUT} 请输入选项编号并回车：${NC}"
}

exec_driver() {
    echo "${INFO} ${BOLD}${BLUE}正在加载林羽驱动 5.3 ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/linyudev.sh https://gitee.com/MingMengFree/Games/raw/master/LinYuDriverLoader5.3.sh && chmod 755 /data/adb/linyudev.sh && /data/adb/linyudev.sh && rm -rf /data/adb/linyudev.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}林羽驱动执行完成${NC}"
}

exec_kernel() {
    echo "${INFO} ${BOLD}${BLUE}正在加载林羽内核 ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/linyu.sh https://gitee.com/MingMengFree/Games/raw/master/LinYuKernel.Ver.3.0.2.sh && chmod 755 /data/adb/linyu.sh && /data/adb/linyu.sh && rm -rf /data/adb/linyu.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}林羽内核执行完成${NC}"
}

exec_yz() {
    echo "${INFO} ${BOLD}${BLUE}正在执行过验证 ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/linyuyz.sh https://gitee.com/MingMengFree/Games/raw/master/LinYu过电报验证.sh && chmod 755 /data/adb/linyuyz.sh && /data/adb/linyuyz.sh && rm -rf /data/adb/linyuyz.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}过验证执行完成${NC}"
}

exec_clear_as() {
    echo "${INFO} ${BOLD}${BLUE}正在清理下发 ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/asclear.sh https://gitee.com/MingMengFree/Games/raw/master/三角洲清理as下发.sh && chmod 755 /data/adb/asclear.sh && (command -v bash >/dev/null && bash /data/adb/asclear.sh || sh /data/adb/asclear.sh) && rm -rf /data/adb/asclear.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}清理下发完成${NC}"
}

exec_clean3() {
    echo "${INFO} ${BOLD}${BLUE}正在执行一键清理3 ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/nbge.sh https://gitee.com/MingMengFree/Games/raw/master/牛逼哥小助手.sh && chmod 755 /data/adb/nbge.sh && echo 3 | sh /data/adb/nbge.sh && rm -rf /data/adb/nbge.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}一键清理3完成${NC}"
}

exec_random_id() {
    echo "${INFO} ${BOLD}${BLUE}正在随机改三角洲ID ...${NC}"
    su -M -c 'mkdir -p /data/adb && /data/adb/ksu/bin/busybox wget --no-check-certificate -qO /data/adb/nbge.sh https://gitee.com/MingMengFree/Games/raw/master/牛逼哥小助手.sh && chmod 755 /data/adb/nbge.sh && echo 4 | sh /data/adb/nbge.sh && rm -rf /data/adb/nbge.sh'
    echo "${SUCCESS} ${BOLD}${GREEN}随机改ID完成${NC}"
}

# 主循环
while true; do
    show_menu
    read choice
    case "$choice" in
        1) exec_driver ;;
        2) exec_kernel ;;
        3) exec_yz ;;
        4) exec_clear_as ;;
        5) exec_clean3 ;;
        6) exec_random_id ;;
        7)
            echo "${INFO} ${BOLD}${PURPLE}感谢使用 MingMeng 工具箱，再见！${NC}"
            # 删除自身脚本
            rm -f "$SCRIPT_PATH" 2>/dev/null
            exit 0
            ;;
        *)
            echo "${ERROR} ${BOLD}${RED}无效选项，请重新输入${NC}"
            sleep 1
            continue
            ;;
    esac
    echo ""
    echo -n "${INPUT} ${BOLD}${YELLOW}按回车键返回菜单...${NC}"
    read dummy
done