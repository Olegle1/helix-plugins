local PLUGIN = PLUGIN

PLUGIN.name = "Auto Flag"
PLUGIN.author = "eon"
PLUGIN.description = "Gives your selected flags to players when they first join."
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]
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
