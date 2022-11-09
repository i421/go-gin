#!/bin/bash

# -s 去掉符号表 panic的时候stack trace就没有任何文件名/行号信息
# -w 去掉DWARF调试信息,得到的程序不能用gdb调试
go build -ldflags '-s -w' -o comp
