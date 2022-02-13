local HttpService = game:GetService("HttpService")
local UserTypes
do
	local _inverse = {}
	UserTypes = setmetatable({}, {
		__index = _inverse,
	})
	UserTypes.Premium = "afbbf78b-d3f9-4a95-a709-564f4dae5fe9"
	_inverse["afbbf78b-d3f9-4a95-a709-564f4dae5fe9"] = "Premium"
	UserTypes.Free = "4eb973b0-09df-4366-86fe-f191cab840f4"
	_inverse["4eb973b0-09df-4366-86fe-f191cab840f4"] = "Free"
end
local Challenge
do
	Challenge = setmetatable({}, {
		__tostring = function()
			return "Challenge"
		end,
	})
	Challenge.__index = Challenge
	function Challenge.new(...)
		local self = setmetatable({}, Challenge)
		return self:constructor(...) or self
	end
	function Challenge:constructor()
		self.ChallengeURL = "https://challenge.ave.rest/"
	end
	function Challenge:authenticate()
		local Status = self:get_status()
		local _condition = Status.solved
		if not (_condition ~= 0 and (_condition == _condition and (_condition ~= "" and _condition))) then
			_condition = Status.success
		end
		assert(_condition ~= 0 and (_condition == _condition and (_condition ~= "" and _condition)), "Failed to get status / Failed to solve.")
		self.solved = Status.solved
		self.AccountType = UserTypes[Status.user_type]
		self.Provided = Status.challenge_provided
		-- Stupid, but most people probably won't be able to figure out
		-- that the validator is just reverse with "-" replaced as nothing
		local Validator = (string.gsub(self.Provided, "[A-Z]+", ""))
		local SplitID = string.split(self.ID, "-")
		local Inverse = ""
		do
			local i = #SplitID - 1
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
				i = i - 1
				else
					_shouldIncrement = true
				end
				if not (i > -1) then
					break
				end
				local Split = SplitID[i + 1]
				if Split ~= "" and Split then
					Inverse = Inverse .. Split
				end
			end
		end
		self.IsValidated = Inverse == Validator
	end
	function Challenge:get_status()
		local ChallengeData = HttpService:JSONDecode((game.HttpGet(game, self.ChallengeURL .. (self.ID .. "/status"))))
		return ChallengeData
	end
	function Challenge:get_new()
		local ChallengeData = HttpService:JSONDecode((game.HttpGet(game, self.ChallengeURL .. "new")))
		local _arg0 = type(ChallengeData) == "table"
		assert(_arg0, "Challenge data wasn't properly grabbed.")
		local _success = ChallengeData.success
		assert(_success ~= 0 and (_success == _success and (_success ~= "" and _success)), "Failed to create a new challenge.")
		self.ID = ChallengeData.challenge_id
	end
	function Challenge:get_solve_url()
		return self.ChallengeURL .. self.ID
	end
	function Challenge:getAuth()
		self:authenticate()
		return {
			IsValidated = self.IsValidated,
			AccountType = self.AccountType,
		}
	end
end
local Auth
do
	Auth = setmetatable({}, {
		__tostring = function()
			return "Auth"
		end,
	})
	Auth.__index = Auth
	function Auth.new(...)
		local self = setmetatable({}, Auth)
		return self:constructor(...) or self
	end
	function Auth:constructor()
		self.Challenge = Challenge.new()
		self.Challenge:get_new()
	end
	function Auth:getSolveURL()
		return self.Challenge:get_solve_url()
	end
	function Auth:usePremiumKey(PremiumKey)
		local SendRequest = syn and syn.request or request
		-- Only supports KRNL, Synapse X, Script-Ware
		assert(SendRequest, "Usage of the premium key is not supported on this exploit.")
		SendRequest({
			Url = self.Challenge.ChallengeURL .. (self.Challenge.ID .. ("/" .. PremiumKey)),
			Method = "GET",
		})
		return self
	end
	function Auth:attemptSolve()
		return self.Challenge:getAuth()
	end
end

local Authenticator = Auth.new()

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Authenticator | SenseiJoshy.Com/Discord",
    Style = 4,
    SizeX = 350,
    SizeY = 200,
    Theme = "Dark"
})

local AuthPage = UI.New({
    Title = "Main"
})

AuthPage.TextField({
    Text = "Premium Key (Paid Users)",
    Callback = function(Key)
        Authenticator:usePremiumKey(Key)
    end
})

AuthPage.Button({
    Text = "Copy Authentication URL (Free Users)",
    Callback = function()
        setclipboard(Authenticator:getSolveURL())
    end
})

local AuthData

AuthPage.Button({
    Text = "Finish | Execute Script",
    Callback = function()
        AuthData = Authenticator:attemptSolve()
    end
})

AuthPage.Button({
	Text = "Discord Server",
	Callback = function()
		if syn then
			syn.request({
			   Url = "http://127.0.0.1:6463/rpc?v=1",
			   Method = "POST",
			   Headers = {
				   ["Content-Type"] = "application/json",
				   ["Origin"] = "https://discord.com"
			   },
			   Body = game:GetService("HttpService"):JSONEncode({
				   cmd = "INVITE_BROWSER",
				   args = {
					   code = "xgRwzdtnXC"
				   },
				   nonce = game:GetService("HttpService"):GenerateGUID(false)
			   }),
			})
			else 
				setclipboard("https://discord.gg/xgRwzdtnXC")
				game.StarterGui:SetCore("SendNotification", {
				Title = "Please Read!!"; 
				Text = "Discord Link Copied";
				Duration = 35; 
			})
		end
	end
})

repeat task.wait() until AuthData and AuthData.IsValidated

UI.Banner({
    Text = "Logged in: " .. tostring(AuthData.IsValidated) .. " Type: " .. AuthData.AccountType .. " method."
})


if game.PlaceId == 6843905606 then --Critical Legends

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/Critical%20Legends.lua"))()

elseif game.PlaceId == 5094651510 then --Demon Fall

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/(NEW)%20Demon%20Fall.lua"))()

elseif game.PlaceId == 7485253727 then --True Piece

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/true%20piece%202.lua"))()

elseif game.PlaceId == 7056922815 then --Reaper 2

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/Reaper%202.lua"))()

elseif game.PlaceId == 7143997817 then --Simple Piece

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/Simple%20Piece.lua"))()

elseif game.PlaceId == 5181152523 then --Eternal Nightmare

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/Eternal%20Nightmare.lua"))()

elseif game.PlaceId == 5303541547 then --Two Piece

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/Two%20Piece.lua"))()

elseif game.PlaceId == 8311081337 then --One Piece Bursting Rage

loadstring(game:HttpGet("https://raw.githubusercontent.com/SenseiJoshy/Extras/main/One%20Piece%20Bursting%20Rage.lua"))()
end
