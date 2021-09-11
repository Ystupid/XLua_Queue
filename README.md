# XLua_Queue
Lua队列的实现
使用:
local Queue = require 'Queue'\n
local queue = Queue.New()
queue:Enqueue(1)
local value = queue:Dequeue()
