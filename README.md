[![wercker status](https://app.wercker.com/status/ffa2ca687aed854f9e4ea0981d85d615/m "wercker status")](https://app.wercker.com/project/bykey/ffa2ca687aed854f9e4ea0981d85d615) [![Code Climate](https://codeclimate.com/github/otakemaru/spree-tutorial/badges/gpa.svg)](https://codeclimate.com/github/otakemaru/spree-tutorial) [![Test Coverage](https://codeclimate.com/github/otakemaru/spree-tutorial/badges/coverage.svg)](https://codeclimate.com/github/otakemaru/spree-tutorial/coverage)

# spree tutorial

ECサイトを構築するRailsベースのアプリケーション[Spree](https://spreecommerce.com/)を色々動かしてみる。

# 環境構築

- Ruby

  [参考](http://qiita.com/egopro/items/aba12261c053eecd6d19)

- docker

  docker, docker-machine, docker-composeを利用。  
  無くても開発できるが、werckerでも使用するので、あると便利。

# 利用サービス

- [Wercker](https://app.wercker.com/#applications/55a88f8fd6c8a0a94219478e)

  CI  
  wercker CLIをインストールする事で、簡単にローカルにCI環境が再現できる

- [Teatro](http://master.otakemaru-spree-tutorial-24ed74bfae18bad2ce0c.ttrcloud.com/)

  demoアプリケーションのdeploy  
  `.teatro.yml`にdeploy方法を記載したら、deployしてくれる

- [SideCI](https://www.sideci.com/github_repositories/38983565/news_feed)

  コードレビューツール。  
  PR毎に静的解析してくれる。

- [HoundCI](https://houndci.com/)

  同じくコードレビューツール。  
  PR毎にスタイルのチェックをしてくれる。

- [Code Climate](https://codeclimate.com/github/otakemaru/spree-tutorial)

  コードの品質をチェックしてくれる。
