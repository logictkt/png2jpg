# png2jpg
フォルダの中身のpng画像をまとめてjpg画像に変換する

## 使い方
```
cd png2jpg
ruby main.rb folder_path folder_path folder_path
```

> folder_pathのコピーは面倒なので、FinderからD&Dすると楽。

## Folder構造について
```
- folder_1
  - image1.png
  - image2.png
  - image3.png
- folder_2
  - folder_3
    - image4.png
    - image5.png
    - image6.png
  - folder_4
    - image7.png
    - image8.png
    - image9.png
```

このような状態なら処理可能

実行後は下記のようなjpgファイルが作成される

```
- folder_1
  - image1.jpg
  - image2.jpg
  - image3.jpg
- folder_2
  - folder_3
    - image4.jpg
    - image5.jpg
    - image6.jpg
  - folder_4
    - image7.jpg
    - image8.jpg
    - image9.jpg
```
