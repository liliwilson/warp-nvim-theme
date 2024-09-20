local M = {}

local warp_colors = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }

local function contains(list, target)
    for _, value in ipairs(list) do
        if value == target then
            return true
        end
    end
    return false
end

-- parse yaml file
local function parse_yaml(content)
    local result = {}
    local lines = {}
    for line in content:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    local i = 1
    while lines[i] do
        local key, value = lines[i]:match("^(.-):%s*(.-)%s*$")
        if key then
            local trimmed_key = key:gsub("^%s*(.-)%s*$", "%1")
            if trimmed_key == "bright" then
                i = i + 1
                while lines[i] do
                    key, value = lines[i]:match("^(.-):%s*(.-)%s*$")
                    if key then
                        trimmed_key = key:gsub("^%s*(.-)%s*$", "%1")
                        if not contains(warp_colors, trimmed_key) then
                            i = i - 1 -- so that we don't double increment
                            break
                        end
                        result["bright_" .. trimmed_key] = value:sub(2, -2)
                    end
                    i = i + 1
                end
            elseif trimmed_key == "normal" then
                i = i + 1
                while lines[i] do
                    key, value = lines[i]:match("^(.-):%s*(.-)%s*$")
                    if key then
                        trimmed_key = key:gsub("^%s*(.-)%s*$", "%1")
                        if not contains(warp_colors, trimmed_key) then
                            i = i - 1 -- so that we don't double increment
                            break
                        end
                        result["normal_" .. trimmed_key] = value:sub(2, -2)
                    end
                    i = i + 1
                end
            else
                result[key] = value:sub(2, -2)
            end
        end
        i = i + 1
    end
    --
    return result
end

-- load yaml file
function M.load_yaml(filename)
    local file = io.open(filename, 'r')
    if not file then
        print("Failed to open file: " .. filename)
        return nil
    end
    local content = file:read('*all')
    file:close()

    return parse_yaml(content)
end

-- check if it's github link or local
local function is_github_link(link)
    return link:match("^https://raw.githubusercontent.com/")
end

local function fetch_from_github(github_url, output_file)
    local command = string.format('curl -s -o %s %s', output_file, github_url)
    local result = vim.fn.system(command)

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln('failed to download theme from github: ' .. result)
        return false
    end

    return output_file
end

function M.load_config(arg)
    local config_file = nil

    if is_github_link(arg) then
        local temp_file = '/tmp/github_config.yaml'
        config_file = fetch_from_github(arg, temp_file)
    else
        config_file = arg
    end

    if config_file then
        return M.load_yaml(config_file)
    end
end

return M
