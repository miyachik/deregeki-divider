# デレ劇の4コマを1コマずつに分割するrubyスクリプト
`rect.rb`
絶対座標指定の切り抜き

`divide.rb`
4コマの切れ目の黒帯によるパターンマッチング(未完成)

Usage

```ruby
git clone https://github.com/MKenta/deregeki-divider.git
brew install opencv
ruby (divide.rb | rect.rb) ./path/to/image
```
実行結果が `./koma`に吐き出されます。

# Sample
* opencvを使用するので各自インストールしてください。Sampleではmac環境を想定しbrewを使用しています。
```ruby
git clone https://github.com/MKenta/deregeki-divider.git
brew install opencv
gem install ruby-opencv -- --with-opencv-dir=/path/to/opencvdir
wget http://blog-imgs-90.fc2.com/c/g/g/cggekijo/678.jpg
ruby rect.rb ./678.jpg
```
