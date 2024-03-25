vim.loader.enable()

local version = vim.version

local core_config_files = {
	"plugins.lua",
	"options.lua",
}

for _, config_file in ipairs(core_config_files) do
	local module, _ = string.gsub(config_file, ".lua","")
	package.loaded[module] = nil
	require(module)
end
