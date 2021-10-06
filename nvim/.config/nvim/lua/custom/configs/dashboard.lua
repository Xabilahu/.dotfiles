local g = vim.g

g.dashboard_session_directory = '~/.config/nvim/.sessions'
g.dashboard_default_executive ='telescope'
g.dashboard_custom_section = {
    a = {description = {"  Find File                 leader f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   leader f o"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                 leader f w"}, command = "Telescope live_grep"},
    d = {description = {"  New File                  leader f n"}, command = "DashboardNewFile"},
    e = {description = {"  Bookmarks                 leader m  "}, command = "Telescope marks"},
    f = {description = {"  Load Last Session         leader l  "}, command = "SessionLoad"},
    g = {description = {"  Update Plugins            leader u  "}, command = "PackerUpdate"},
    h = {description = {"  Exit                      leader q  "}, command = "exit"}
}
