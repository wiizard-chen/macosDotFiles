import subprocess
import json
import argparse


def get_active_app():
    # 使用 Yabai 命令获取当前活动的应用程序
    result = subprocess.run(
        ["yabai", "-m", "query", "--windows", "--window"],
        capture_output=True,
        text=True,
    )
    if result.returncode == 0:
        try:
            window = json.loads(result.stdout)
            print("---test--- window", window)
            return window["app"]
        except json.JSONDecodeError:
            print("Error decoding JSON")
    return None

def activate_app(app_name):
    # 激活指定的应用程序
    subprocess.run(["open", "-a", app_name])

def switch_to_recent():
    # 使用 Yabai 命令切换到指定应用程序
    subprocess.run(["yabai", "-m", "window", "--focus", "recent"])


def main(target_app):
    # 检查当前活动的应用程序
    active_app = get_active_app()
    if active_app == target_app:
        # 如果当前应用程序是特定应用程序，则切换到另一个应用程序
        switch_to_recent()
    else:
        # Vscode 特别处理
        if target_app == 'Code':
            activate_app('Visual Studio Code')
        else:
            activate_app(target_app)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("target_app", help="The target application to switch to")
    args = parser.parse_args()
    main(args.target_app)
