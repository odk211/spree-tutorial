[![wercker status](https://app.wercker.com/status/93c374726ff835d1c3116a48e4753150/m "wercker status")](https://app.wercker.com/project/bykey/93c374726ff835d1c3116a48e4753150) [![Code Climate](https://codeclimate.com/github/odk211/spree-tutorial/badges/gpa.svg)](https://codeclimate.com/github/odk211/spree-tutorial) [![Test Coverage](https://codeclimate.com/github/odk211/spree-tutorial/badges/coverage.svg)](https://codeclimate.com/github/odk211/spree-tutorial/coverage)

# spree tutorial

ECサイトを構築するRailsベースのアプリケーション[Spree](https://spreecommerce.com/)を色々動かしてみる。

# 環境構築

- Ruby

  [参考](http://qiita.com/egopro/items/aba12261c053eecd6d19)

- docker

  docker, docker-machine, docker-composeを利用。  
  無くても開発できるが、werckerでも使用するので、あると便利。

# 利用サービス

- [Wercker](http://wercker.com/)

  CI  
  wercker CLIをインストールする事で、簡単にローカルにCI環境が再現できる

- [Teatro](https://teatro.io/)

  demoアプリケーションのdeploy  
  `.teatro.yml`にdeploy方法を記載したら、deployしてくれる

- [SideCI](https://www.sideci.com/)

  コードレビューツール。  
  PR毎に静的解析してくれる。

- [HoundCI](https://houndci.com/)

  同じくコードレビューツール。  
  PR毎にスタイルのチェックをしてくれる。

- [Code Climate](https://codeclimate.com/)

  コードの品質をチェックしてくれる。
