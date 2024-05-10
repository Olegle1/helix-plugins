local PLUGIN = PLUGIN

PLUGIN.name = "Ragdoll Cleaner"
PLUGIN.author = "eon (bloodycop)"
PLUGIN.description = "Removes ragdolls from the map."
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

ix.config.Add("removeRagdolls", true, "Whether or not to remove ragdolls from the map.", nil, {
    category = PLUGIN.name
})

ix.config.Add("removeRagdollsTime", 300, "How long ragdolls should stay before being removed.",
    function(oval, nval)
        if ( timer.Exists("ixRagdollRemover") ) then
            timer.Adjust("ixRagdollRemover", nval, 0)
        end
    end,
    {category = PLUGIN.name}
)

ix.lang.AddTable("english", {
    optRemoveRagdolls = "Remove Ragdolls",
    optdRemoveRagdolls = "Whether or not to remove ragdolls from the map.",

    optRemoveRagdollsTime = "Ragdoll Removal Time",
    optdRemoveRagdollsTime = "The delay in seconds between ragdoll cleaning."
})

if ( SERVER ) then
    function PLUGIN:InitPostEntity()
        timer.Simple(1 / 3, function()
            timer.Create("ixRagdollRemover", ix.config.Get("removeRagdollsTime", 300), 0, function()
                if not ( ix.config.Get("removeRagdolls", true) ) then
                    return
                end
    
                for k, ent in ents.Iterator() do
                    local class = ent:GetClass()

                    if ( SERVER ) then
                        if ( class == "prop_ragdoll" ) then
                            ent:Remove()
                        end

                        return
                    end

                    if ( class == "class C_ClientRagdoll" ) then
                        ent:Remove()
                    end
                end
            end)
        end)
    end 
end