local PLUGIN = PLUGIN

PLUGIN.name = "Character Menu Image"
PLUGIN.author = "eon (bloodycop)"
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

PLUGIN.images = {
    {"icon16/anchor.png", Color(255, 255, 255)}, // replace with your material (ex: icon16/anchor.png).
}

if ( SERVER ) then
    return
end

local randomImageID = 1

if not ( timer.Exists("ix.gui.characterMenu.ImageSwitcher") ) then
    timer.Create("ix.gui.characterMenu.ImageSwitcher", 10, 0, function()
        if not ( ix.gui.characterMenu ) then
            ErrorNoHalt("[ix] [plugin: characterimage]: characterMenu not registered.")
            return
        end

        if ( #PLUGIN.images > 0 ) then
            local newTable = table.Copy(PLUGIN.images)

            table.remove(newTable, randomImageID) // Make sure the current image is removed from a randomized table.

            randomImageID = math.random(1, #newTable)
        else
            randomImageID = math.random(1, #PLUGIN.images)
        end
    end)
end

if ( ix.gui.characterMenu ) then
    local oldFunc = ix.gui.characterMenu.Paint

    if ( IsValid(ix.gui.characterMenu) ) then
        ix.gui.characterMenu.Paint = function(s, w, h)
            local img = PLUGIN.images[randomImageID][1]
            local drawCol = PLUGIN.images[randomImageID][2] or color_white

            surface.SetDrawColor(drawCol)
            surface.SetMaterial(img)
            surface.DrawTexturedRect(0, 0, w, h)

            oldFunc(s, w, h)
        end
    end
end
