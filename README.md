# README


> ### アプリケーション名

　　ながのCAKE(ケーキ屋のECサイト)

<br>

> ### 概要

　　架空の洋菓子店の通販用サイト<br>
　　管理者(admin)側で管理、顧客(costomer)側で注文ができるように実装

<br>

> ### 機能

　**【顧客側】**

　　**1. ログイン機能** <br>
　　　・ メールアドレス、パスワードでログインできる  
　　　・ ログイン時のみ利用できる機能が有効になる  

　　**2. ログアウト機能** <br>
　　　・ ログイン状態からログアウト状態にできる  
　　　・ ログイン時のみ利用できる機能が無効になる  

　　**3. 商品一覧表示機能** <br>
　　　・ 商品と商品ジャンルを一覧表示できる  

　　**4. 商品詳細情報表示機能** <br>
　　　・ 商品一覧画面で選択した商品の詳細情報を表示できる  
　　　・ カート追加機能が表示される  

　　**5. カート追加機能** <br>
　　　・ カートに商品を追加することができる  

　　**6. カート一覧機能** <br>
　　　・ カートの中身を一覧表示することができる  

　　**7. カート編集機能** <br>
　　　・ カートの中身の個数を編集したり、削除したりすることができる  

　　**8. 注文機能** <br>
　　　・ カートの中身の購入が可能  
　　　・ 支払方法や配送先を設定することができる  

　　**9. 会員情報編集機能** <br>
　　　・ 登録している情報を編集できる  

　　**10. 退会機能** <br>
　　　・ 退会手続きを行うことができる  

　　**11. 配送先追加・編集機能** <br>
　　　・ 登録している配送先を一覧で確認できる  
　　　・ 配送先の新規追加・修正・削除が可能  

　　**12. 注文履歴一覧表示機能** <br>
　　　・ 過去の注文概要を一覧で確認できる  

　　**13. 注文履歴詳細表示機能** <br>
　　　・ 注文の詳細（注文商品や個数など）を確認できる  

　**【管理者側】**

　　**1. ログイン機能** <br>
　　　・ メールアドレス、パスワードでログインできる  
　　　・ ログイン時のみ利用できる機能が有効になる  

　　**2. ログアウト機能** <br>
　　　・ ログイン状態からログアウト状態にできる  
　　　・ ログイン時のみ利用できる機能が無効になる  

　　**3. 注文履歴一覧表示機能** <br>
　　　・ 注文履歴を一覧で確認できる  

　　**4. 注文履歴詳細表示機能** <br>
　　　・ 注文の詳細（注文商品や個数など）を確認できる  
　　　・ 注文ステータス、製作ステータスを変更できる  

　　**5. 顧客一覧表示機能** <br>
　　　・ 顧客情報を一覧で確認できる  

　　**6. 顧客詳細情報表示機能** <br>
　　　・ 顧客の詳細情報を確認できる  
　　　・ 顧客のステータス（有効/退会）を切り替えられる  

　　**7. 商品一覧表示機能** <br>
　　　・ 登録商品を一覧で確認できる  

　　**8. 商品詳細情報表示機能** <br>
　　　・ 商品の詳細情報を確認できる  

　　**9. 商品情報変更機能** <br>
　　　・ 商品の登録情報を変更できる  
　　　・ 販売ステータスを変更できる  

　　**10. ジャンル設定機能** <br>
　　　・ ジャンルの追加・変更が可能  

<br>

> ### 使い方

　管理者ログインはメールアドレスを【sample@example.com】、パスワードは【159357】で使用  
　管理者アカウントはseedsファイルに記述済  
　顧客側の場合、新規作成で好きなアカウントを作成して利用が可能  

<br>

> ### バージョン
* Rails 6.1.7.8  
* ruby 3.1.2

<br>

> ### gem一覧
* devise
* devise-i18n
* rails-i18n
* kaminari
* bootstrap
  
<br>

> ### インストール
　最新のマスターブランチをクローンし、ローカル環境で使用

　$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object  
　$ yarn add jquery bootstrap@4.6.2 popper.js  
　$ rails db:migrate  
　$ bundle install  
　$ rails db:seed  
 
<br>

> ### 作者

　Cチーム（もみましぷりん）  
　　**も**っちー：望月美里  
　　**み**っころ：猿楽美歩  
　　**ま**いやん：中田舞  
　　**し**まさん：生島沙織
