local PLUGIN = PLUGIN

PLUGIN.name = "Auto Flag"
PLUGIN.author = "eon"
PLUGIN.description = "Gives your selected flags to players when they first join."

PLUGIN.flagList = {}

for k, v in SortedPairs(ix.flag.list) do
    ix.config.Add("autoflag_" .. k, false, v.description, function(bValue)
        if ( bValue ) then
            PLUGIN.flagList[k] = true

            if ( SERVER ) then
                for k2, v2 in ipairs(player.GetAll()) do
                    local char = v2:GetChar()

                    if not ( char ) then
                        continue
                    end

                    if ( char:HasFlags(k) ) then
                        continue
                    end

                    char:GiveFlags(k)
                end
            end
        else
            PLUGIN.flagList[k] = nil
        end
    end, {
        category = "AutoFlag"
    })

    ix.lang.AddTable("english", {
        ["optAutoflag_" .. k] = "Auto Flag: " .. k,
        ["optdAutoflag_" .. k] = "Whether or not to give the " .. k .. " flag to players automatically."

    })
end

if ( SERVER ) then
    function PLUGIN:PlayerLoadedCharacter(ply)
        local char = ply:GetChar()

        if not ( char ) then
            return
        end

        for k, v in pairs(self.flagList) do
            if ( char:HasFlags(k) ) then
                continue
            end

            char:GiveFlags(k)
        end
    end
end

for k, v in SortedPairs(ix.flag.list) do
    if ( ix.config.Get("Flag: " .. k, false) ) then
        PLUGIN.flagList[k] = true
    end
end
