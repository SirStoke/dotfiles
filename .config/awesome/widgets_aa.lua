local powerline = require('powerline')
local vicious = require('vicious')
wibox = require('wibox')

--local bgcolor1 = '#151515' 
local bgcolor1 = '#222222'
local bgcolor2 = '#6D9EAC' 

local wiboxbgcolor = '#222222'

local color1 = "#aaaaaa"
local color2 = "#222222"

function getwidget() 
    return wibox.widget {
       widget = wibox.widget.textbox
    }
end

function cpuwidget(bgcolor, color)
   local widget = getwidget()

   local markup = powerline:formatMarkup("CPU $1%", bgcolor, color)

   widget:set_markup(markup)

   vicious.register(widget, vicious.widgets.cpu, markup, 60)

   return widget
end

function datewidget(bgcolor, color)
   local widget = getwidget()

   local markup = powerline:formatMarkup("%b %d %R", bgcolor, color)

   widget:set_markup(markup)

   vicious.register(widget, vicious.widgets.date, markup, 60)

   return widget
end

function tempwidget(bgcolor, color)
   local widget = getwidget()

   local markup = powerline:formatMarkup("$1°C", bgcolor, color)

   widget:set_markup(markup)

   vicious.register(widget, vicious.widgets.thermal, markup, 60, {'coretemp.0', 'core'})

   return widget
end

function memwidget(bgcolor, color)
   local widget = getwidget()

   local markup = powerline:formatMarkup("MEM $1%", bgcolor, color)

   widget:set_markup(markup)

   vicious.register(widget, vicious.widgets.mem, markup, 60)

   return widget
end

function fswidget(bgcolor, color)
   local widget = getwidget()

   local markup = powerline:formatMarkup("${/ used_gb}GB / ${/ avail_gb}GB", bgcolor, color)

   widget:set_markup(markup)

   vicious.register(widget, vicious.widgets.fs, markup, 60)

   return widget
end

function leftarrow(bgcolor, color)
   local widget = getwidget()

   widget:set_markup(powerline:leftArrow(bgcolor, color))

   return widget
end

-- concats two tables
local function concat(...)
    local t = {}

    for n = 1,select("#",...) do
        local arg = select(n,...)
        if type(arg)=="table" then
            for _,v in ipairs(arg) do
                t[#t+1] = v
            end
        else
            t[#t+1] = arg
        end
    end

    return t
end

-- gets the tail of a table (allocates a new table)
local function tail(tbl)
     if #tbl < 1 then
         return {}
     else
         local newtbl = {}
         local tblsize = #tbl
         local i = 2
         while (i <= tblsize) do
             table.insert(newtbl, i-1, tbl[i])
          i = i + 1
         end
        return newtbl
     end
end

local widgets = { datewidget, cpuwidget, memwidget, fswidget, tempwidget }

function getWidgets(bgcolor, widgets, isFirst)
   local realbg
   local arrowcolor
   local realcolor
   local first = isFirst or false

   if bgcolor == bgcolor1 then
      realbg = bgcolor2
      realcolor = color2
   else
      realbg = bgcolor1
      realcolor = color1
   end

   if realbg == bgcolor1 then
      arrowcolor = bgcolor1
   else
      arrowcolor = bgcolor2
   end

   -- first arrow, wibox bg color
   if first then
      bgcolor = wiboxbgcolor
   end
      
   if #widgets == 0 then
      return {}
   else
      local leftarrowwidget = leftarrow(bgcolor, arrowcolor) 
      local widget = widgets[1](realbg, realcolor)

      return concat({leftarrowwidget, widget}, getWidgets(realbg, tail(widgets)))
   end
end

return getWidgets(bgcolor1, widgets, true)
