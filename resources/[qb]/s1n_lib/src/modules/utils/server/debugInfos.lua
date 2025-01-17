Utils = Utils or {}

-- Get the debug infos need for a developer or support agent to investigate an issue
-- @return table The debug infos
function Utils:GetDebugInfos()
    return {
        gameBuild = GetGameBuildNumber(),
        currentServerEndpoint = GetCurrentServerEndpoint(),

        framework = Framework:GetCurrentFrameworkName(),
    }
end

-- Print the debug infos in the console
function Utils:PrintDebugInfos()
	print(json.encode(self:GetDebugInfos(), { indent = true }))
end

RegisterCommand("s1n_debugInfos", function()
	Utils:PrintDebugInfos()
end, true)
