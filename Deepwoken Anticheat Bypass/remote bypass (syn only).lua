--{[Made By:Introvert#1337]}--
local ui_manager = game:GetService("Players").LocalPlayer.PlayerScripts.UIManager;
local ui_manager_get_remote = getupvalue(getconnections(game:GetService("TextService").ChildAdded)[1].Function, 2);

local function_key = getconstant(ui_manager_get_remote, 1);
local get_key_function = getupvalue(ui_manager_get_remote, 1)[1];

local function get_remote(remote_name)
   return syn.secure_call(get_key_function, ui_manager, remote_name, function_key);
end;
