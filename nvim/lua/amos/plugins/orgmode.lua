-- import orgmode plugin safely
local setup, orgmode = pcall(require, "orgmode")
if not setup then
	return
end

-- configure/enable orgmode
orgmode.setup({
	org_agenda_files = { "~/Documents/personal_wiki/*" },
})
