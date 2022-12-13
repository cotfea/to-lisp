# newLisp

- 文档地址: http://newlisp.nfshost.com/downloads/newlisp_manual.html

## 源文件

### 执行程序文件

- 创建文件 main.lsp

```lisp
(println "Hello newLisp!!!")
(exit)
```

- 执行 newlisp ./main.lsp

```bash
>> newlisp ./main.lsp
Hello newLisp!!!
```

### 导入其他程序文件

从环境变量 NEWLISPDIR 指定的文件夹路径导入

```lisp
(env "NEWLISPDIR" ((exec (append "dirname" " " (real-path (append (real-path) "/" (main-args 1))))) 0))
(load (real-path (append (env "NEWLISPDIR") "/" "./Hello.lsp")))
```

或者直接导入 ```$NEWLISPDIR``` 下 modules 文件夹下模块

```lisp
(module "mysql.lsp")
```

### 涉及内置 api

- env

  获取/指定 系统环境变量

- exec / !

  执行系统命令。

- append

  组合成列表

- real-path

  相对路径转换绝对路径

  不带任何参数使用，等价于 (env "PWD") 或者 (exec "pwd")

- load

  导入 指定 模块

- module

  导入 ```$NEWLISPDIR``` 下 modules 文件夹下模块
