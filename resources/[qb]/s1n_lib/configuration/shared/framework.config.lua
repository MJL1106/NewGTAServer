Config = Config or {}

-- Here you can set the framework that you are using
-- The framework that you are using will be detected automatically
Config.Framework = {
    -- You can set your EXACT framework script name here.
    -- For example, if you're using QBCore, you need to set this to "qb-core" (if you haven't changed the name of the script)
    -- Or, if you're using ESX, you need to set this to "es_extended" (if you haven't changed the name of the script)
    resourceName = "",

    esx = {
        events = {
            -- This is the event that will be triggered to get the ESX object if you are using one of the old ESX versions
            getSharedObject = "esx:getSharedObject",
        }
    }
}