local M = {}

function M.md_to_pdf()
  print("Converting ...")
  local md_file = vim.fn.expand('%:t')
  local pdf_file = vim.fn.split(md_file, "\\.", false)[1] .. ".pdf"

  -- Check if the md-to-pdf command exists
  local command_exists = vim.fn.executable('md-to-pdf') == 1

  if command_exists then
	vim.fn.system({"md-to-pdf", md_file})
	vim.fn.system({"open", vim.fn.split(vim.fn.expand('%:t'), "\\.", false)[1] .. ".pdf"})
	print("File " .. pdf_file .. " created")
  else
    print("md-to-pdf command not found. Please make sure it is installed and accessible in your system's PATH.")
  end
end

vim.api.nvim_create_user_command("Pdf", M.md_to_pdf, {})

return M

