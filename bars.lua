PLUGIN.name = "Bars"
PLUGIN.author = "eon (bloodycop)"
PLUGIN.descripton = "Adds a config to disable bars"

ix.config.Add("shouldHideBars", true, "hide bars", nil,{
  category = "Appearance"
})

ix.lang.AddTable("english", {
  optShouldHideBars = "Hide Helix Bars",
  optdShouldHideBars = "Whether or not to hide the bars."
})

function PLUGIN:ShouldHideBars()
  return ix.config.Get("shouldHideBars", true)
end
