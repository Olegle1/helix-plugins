local PLUGIN = PLUGIN

PLUGIN.name = "Playsound"
PLUGIN.description = "Adds /PlaySound command"
PLUGIN.author = "eon (bloodycop)"
PLUGIN.license = [[
Copyright 2024 eon (bloodycop)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]


if ( SERVER ) then
   util.AddNetworkString("ixPlaysoundPlay")

   ix.command.Add("PlaySound", {
      description = "Plays a sound.",
      arguments = ix.type.string,
      OnRun = function(_, ply, sound)
         if not ( ply:IsSuperAdmin() ) then
            ply:Notify("You don't have access to this command.")
            return
         end
         
         net.Start("ixPlaysoundPlay")
            net.WriteString(tostring(sound))
         net.Broadcast()
      end
   })
else
   net.Receive("ixPlaysoundPlay", function(len)
      local snd = net.ReadString()
      
      LocalPlayer():EmitSound(tostring(snd))
   end)   
end
