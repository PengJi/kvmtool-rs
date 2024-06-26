strace 是一个强大的诊断、调试和教学工具，用于在 Unix 和类 Unix 系统上监控和记录程序执行过程中的系统调用和接收到的信号。
它非常有用于分析程序在执行期间与操作系统如何交互，这对于理解程序行为、调试程序中的错误以及优化性能等都非常有帮助。

主要功能
1. 追踪系统调用：strace 可以显示一个程序执行的所有系统调用，例如文件操作、内存分配和网络通信。
2. 追踪信号交付：记录程序收到的所有信号，这对于调试和理解异常行为（如程序崩溃）非常有用。
3. 条件过滤：可以指定只追踪特定的系统调用或只监控来自特定信号的调用。
4. 性能分析：可以统计各个系统调用的时间、调用次数和错误，帮助识别性能瓶颈。

示例
```bash
# 显示 ls -l /home 命令执行过程中发生的所有系统调用。
strace ls -l /home

# 通过指定进程 ID（PID）来追踪它
strace -p 1234

# 使用 -c 选项可以在程序执行完毕后显示每个系统调用的统计信息，如调用次数、错误次数、调用占总时间的百分比等
strace -c ls /home
```

[strace](https://wangchujiang.com/linux-command/c/strace.html)  
