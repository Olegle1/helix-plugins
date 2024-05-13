local PLUGIN = PLUGIN

PLUGIN.name = "Ambience Removal"
PLUGIN.description = "Removes in-game ambience from the map."
PLUGIN.author = "eon (bloodycop)"
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

ix.config.Add("removeAmbience", true, "Whether or not to remove ambience from the map.", nil, {
    category = "Ambience Removal"
})

ix.lang.AddTable("english", {
    optRemoveAmbience = "Remove Ambience/Soundscapes.",
    optdRemoveAmbience = "Whether or not to remove ambience from the map."
})

if ( SERVER ) then
    local ambienceEnts = {
        ["ambient_generic"] = true,
        ["env_soundscape"] = true,
        ["env_soundscape_proxy"] = true
    }

    function PLUGIN:InitPostEntity()    
        timer.Simple(1 / 3, function()
            if not ( ix.config.Get("removeAmbience", true) ) then
                return 
            end

            for index, class in ipairs(table.GetKeys(ambienceEnts)) do
                for _, entity in ipairs(ents.FindByClass(class)) do
                    entity:Remove()
                end
            end
        end)
    end
end
