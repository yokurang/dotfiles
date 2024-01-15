return {
	"itchyny/calendar.vim",

	calendar_google_calendar = 1,
	calendar_google_task = 1,
	calendar_google_api_key = vim.fn.getenv("GOOGLE_API_KEY"),
	calendar_google_client_id = vim.fn.getenv("GOOGLE_CLIENT_ID"),
	calendar_google_client_secret = vim.fn.getenv("GOOGLE_CLIENT_SECRET"),
}
