
word press plugin 検索用のcli


```
npm install
npm install coffee-script -g

./wpp-cli.sh keyword per_page page

ghq get $(./wpp-cli.sh keyword | peco | awk -F":" '{ print "http://plugins.svn.wordpress.org/" $1 }' )
```

### 参考

WordPress.org API
http://codex.wordpress.org/WordPress.org_API


Communicating With the WordPress.org Plugin API
http://code.tutsplus.com/tutorials/communicating-with-the-wordpress-org-plugin-api--wp-33069
