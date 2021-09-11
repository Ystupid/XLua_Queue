local Queue = {}

---清空所有元素
---@param self table
local Clear = function(self)
    self._array = {}
    self._head = 1
    self._tail = 1
    self.count = 0
end

---将元素存入队列尾
---@param self table
---@param element any
local Enqueue = function(self, element)
    self.count = self.count + 1
    self._array[self._tail] = element
    self._tail = self._tail + 1
end

---移除并返回位于队列头的元素
---@param self table
---@return nil
local Dequeue = function(self)
    if self.count <= 0 then
        print("队列元素数量等于零")
        return nil
    end

    self.count = self.count - 1
    local element = self._array[self._head]
    self._array[self._head] = nil
    self._head = self._head + 1

    if self.count <= 0 then
        self:Clear()
    end
    return element
end

---返回位于队列头的元素
---@param self table
---@return nil
local Peek = function(self)
    if self.count <= 0 then
        print("队列元素数量等于零")
        return nil
    end
    return self._array[self._head]
end

---查询队列中是否包含指定元素
---@param self table
---@param element any
---@return boolean
local Contains = function(self, element)
    if self.count <= 0 then
        return false
    end

    for i = self._head, self._tail do
        if self._array[i] == element then
            return true
        end
    end
    return false
end

---创建一个队列并返回
---@return table
local New = function()
    local queue = {}
    setmetatable(queue, {__index = Queue})
    queue:Clear()
    return queue
end

Queue.Clear = Clear
Queue.Enqueue = Enqueue
Queue.Dequeue = Dequeue
Queue.Peek = Peek
Queue.Contains = Contains
Queue.New = New

return Queue