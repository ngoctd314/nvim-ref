local fn = vim.fn
local install_path = fn.stdpath('data')
print(fn.glob(install_path))
print(fn.empty(fn.glob(install_path)))

print(install_path)
