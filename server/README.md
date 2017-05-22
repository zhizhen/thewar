# Goddess -- a fast, scalable mmo game server framework for erlang

### 编译
    make

### 清理
    make clean

### 生成文档
    make docs

### 清理文档
    make clean-docs

### 执行测试用例
    make tests

### 执行单元测试
    make eunit

### 执行集成测试
    make ct

### 生成plt文件
    make build-plt

### 执行dialyze
    make dialyze

### 启动（daemon模式）
    ./goddessctl start

### 启动（交互模式）
    ./goddessctl live

### （交互模式shell中）启动一个机器人
    robot_manager:login_one().

### （交互模式shell中）启动批量机器人
    robot_manager:login_many(integer()).

### （交互模式shell中）显示所有正在运行的机器人
    robot_manager:show_online().

### 启动（debug模式，自动加载beam）
    ./goddessctl debug

### 查看服务器状态
    ./goddessctl status

### 关闭服务器
    ./goddessctl stop

### 重启服务器
    ./goddessctl restart

### 新建 erlang application
    ./rebar create-app appid=demo
    ./rebar c-a appid=demo
    ./rebar create template=app appid=demo

### 新建 erlang api module
    ./rebar create template=api apiid=demo
    
### 新建 erlang module
    ./rebar create template=mod modid=demo

### 新建 erlang gen_server
    ./rebar create template=srv srvid=demo
    
### 列出可以使用的模板
    ./rebar list-template
    ./rebar l-t
    
### 使用rebar时,显示debug信息
    -v
    -vv
    -vvv
    
### 编译
    1 编译
        ./rebar compile
            -j 指定编译进程数量,默认3个
    2 清理beam
        ./rebar clean
    3 组合使用
        ./rebar clean compile

### 测试
    ./rebar eunit
        suites= 指定测试模块

### 生成文档
    ./rebar doc
