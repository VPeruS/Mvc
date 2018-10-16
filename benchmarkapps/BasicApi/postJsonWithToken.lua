-- script that retrieves an authentication token to send in all future requests and adds a body for those requests
-- keep this file and getWithToken.lua in sync with respect to token handling
local open = io.open

local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function init(args)
    wrk.method = "POST"
    wrk.body = read_file('content.txt')
    wrk.headers["Content-Type"] = "application/x-www-form-urlencoded"
    req = wrk.format()
end    

function request()
    return req
end

