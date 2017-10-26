# Rails new app for docker-compose and docker-sync

## 事前準備
- docker for mac (17.09.0-ce-mac35)
- docker-sync (version 0.4.6)
- docker-compose (version 1.16.1, build 6d1ac21)
- docker image (ruby:2.4.1)


## 手順

1. `git clone`
2. `cd [dir]`
3. `init.sh`実行
4. `.docker/template/rubymine_debug`に内容を`Gemfile`へ追記
5. `docker-compose run --rm app bundle install`
5. `boot.sh`実行`
6. `docker-compose up`

※起動できるか確認


# Rubymine設定
1. Rubymine起動
2. Preferences -> Ruby SDK and Gems -> New remote ->  docker-compose 
※pathmapの設定はしておく
3. docker-compose.yml の service [app]を選択
※ gemのインストールが行われる
4. `.idea`を削除してRubyMineを再起動してプロジェクトの再作成
5. 再起動時にdevelopment/productionのRails Configurationsが作成されるはず
6. debug実行 (Path Mapの設定等はしない)
※Local Pathをローカルディレクトリに設定をしてしまうと、ブレークポイントが有効にならない。
※IDE側で作成されたstubを利用してデバックしているようなのでここの設定はしないこと

## gem list


## 備考
- docker-sync は`unison`を使用
    - [`naitive_osx`](https://github.com/EugenMayer/docker-sync/wiki/8.1.-native_osx-sync-strategy-debugging-guide)のほうが高速のようだがまだ安定版ではないので 
    - `naitive_osx`はコンテナ間双方向通信ができそう
    - `unison`はport経由で同期処理
 

