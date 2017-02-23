local wibox = require("wibox")

function hexify(s)
    return s:gsub("\\x(%x%x)",function (x) return string.char(tonumber(x,16)) end)
end

local lefthardarrow = hexify("\\xee\\x82\\xb2")
local leftsoftarrow = hexify("\\xee\\x82\\xb3")
local righthardarrow = hexify("\\xee\\x82\\xb0")

powerline = {}

function powerline:formatMarkup(markup, bgcolor, color)
   return [[<span bgcolor="]] .. bgcolor .. [[" font="Arial 18"><span rise="2000" color="]] .. color .. [[" font="Terminess Powerline 8">]] .. markup .. [[</span> </span>]]
end

function powerline:leftArrow(bgcolor, color)
    return [[<span bgcolor="]] .. bgcolor .. [[" color="]] 
       .. color .. '" font="Terminess Powerline 200">' .. lefthardarrow .. '</span>'
end

return powerline
