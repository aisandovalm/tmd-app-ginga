--Los datos se deberán obtener desde un servidor...
--Por ahora solo se escriben directamente en el código
--Campos de texto a mostrar en la app
local name_profile1 = 'Roger'
local second_profile1 = 'Federer'


local name_profile2 = 'Novak'
local second_profile2 = 'Djokovic'


--local json = require "json"
--local t = json.decode(jsonFile("stats.json"))

function redraw ()
	--Profile
	canvas:attrFont('vera',30,'bold')
	canvas:attrColor('black')
	canvas:drawText(160,30, name_profile1)
	canvas:drawText(140,60, second_profile1)

	canvas:drawText(160,170, name_profile2)
	canvas:drawText(140,200, second_profile2)




	canvas:flush()
end

local function handler (evt)
	if evt.class ~= 'ncl' then return end

	if evt.type == 'attribution' then
		if evt.name == 'text' then
			if evt.action == 'start' then
				TEXT = evt.value
				evt.action = 'stop'
				event.post(evt)
			end
		end
	end
	redraw()
end
event.register(handler)