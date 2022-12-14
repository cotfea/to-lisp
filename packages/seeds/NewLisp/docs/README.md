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

### 其他内置 api

- constant

  绑定操作符到 方法

- import

  直接导入动态链接库 的指定 方法，类似于 ffi

### 运算

- + - * / ++ -- %

  算术运算符

- < > = <= >= !=

  逻辑操作符

- abs

  取绝对值

- gcd

  取最大公约数

- even?

  判断是否为偶数

- odd?

  判断是否为奇数

- number?

  判断是否为数值，包含整数和浮点数形式

- zero?

  判断是否为 0，包含整数和浮点数形式 0 或 0.0

- float

  转换为 浮点数

- bigint

  转换为 大整数

### lambda

- lambda / fn

  创建匿名函数

- lambda-macro

  创建匿名宏

- set

  设置变量

- context

  设置 key-mirror

使用 set - lambda 设置具名函数

## 表达式列表

- length

  返回表达式长度

- first

  返回表达式第一个元素

- last

  返回表达式最后一个元素

- append

  追加

- cons

  类似于 join

## 方法

- define

- apply

## 函数式

- map

- setq

- setf
