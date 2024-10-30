-- Function to load environment variables from a .env file
local function load_env(file)
    local env_path = vim.fn.stdpath("config") .. "/" .. file
    local env_file = io.open(env_path, "r")

    if not env_file then
        print("Could not find file: " .. env_path)
        return
    end

    for line in env_file:lines() do
        local key, value = string.match(line, "(%w+)%s*=%s*(.*)")
        if key and value then
            table[key] = value
        end
    end

    env_file:close()
end

-- Load the environment variables from the .env file
load_env(".env")

vim.g.env_vars = table
