local EventBus = {}
local listeners = {}

function EventBus.Subscribe(eventName, callback)
    if not listeners[eventName] then
        listeners[eventName] = {}
    end
    table.insert(listeners[eventName], callback)
end

function EventBus.Fire(eventName, ...)
    if listeners[eventName] then
        for _, callback in ipairs(listeners[eventName]) do
            task.spawn(callback, ...)
        end
    end
end

return EventBus