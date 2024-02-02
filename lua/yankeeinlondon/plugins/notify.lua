return {
	"notify",
	config = function()
		local notify = require('notify')
		local notice = function(title, body, level)
			notify({ title = title or  "Notification" }, body, { level = level or "info" })
		end

	return notice

	end,
}


