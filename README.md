# HyperReboot

アジ鯖はWindowsサーバーのHyper-V上のLinuxという非常に難解な構成をしています

このPowershellスクリプトは全てを適切に再起動し、完全なLinux化までの一時的な解決策を提供します

## 引数

- **-DownAllVM** 全てのVMを停止します
- **-RebootSBRouter** ソフトバンクのルーターを再起動します
- **-OSReboot** OSを再起動します
- **-WaitSBRouter** ソフトバンクのルーターの起動を待機します
- **-UpAllVM** 全てのVMを起動します
