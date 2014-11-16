
word press plugin 検索用のcli

### install

```
npm install
npm install coffee-script -g
```

### use

#### プラグインを検索する

```
./wpp-cli.sh keyword per_page page
```

##### サンプル

```
$ ./wpp-cli.sh wordpress 5 1
{ page: 1, pages: 3928, results: '19636' }
popups: Increase your followers ratio 40% with the new Popups - Multiple popup options, scroll triggered popups with multiple options
spam-free-wordpress:    Todd Lahman&#039;s comment spam blocking plugin that blocks automated spam with zero false positives.
pure-chat:      Pure Chat is a leading live chat software that allows businesses to engage their customers in real time, from anywhere. Sign up and try it for free!
ad-widget:      Easily upload ad images and ad code to your sidebar. For those that don&#039;t need or
want a complicated ad management system.
exit-pop:       Boost sales and increase conversions using targeted offers!

```

#### 検索したプラグインをghqでチェックアウトして管理する


```
ghq get $(./wpp-cli.sh keyword | peco | awk -F":" '{ print "http://plugins.svn.wordpress.org/" $1 }' )
```

### 参考

WordPress.org API
http://codex.wordpress.org/WordPress.org_API


Communicating With the WordPress.org Plugin API
http://code.tutsplus.com/tutorials/communicating-with-the-wordpress-org-plugin-api--wp-33069
