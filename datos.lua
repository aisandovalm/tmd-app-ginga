local profile1 = 'Roger Federer'
local estatura1 = '185 cm'
local peso1 = '85 kg'
local camp_gan1 = '79 Títulos'

local profile2 = 'Novak Djokovic'
local estatura2 = '188 cm'
local peso2 = '80 kg'
local camp_gan2 = '45 Títulos'

--local json = require "json"
--local t = json.decode(jsonFile("stats.json"))

function redraw ()
	--Profile
	canvas:attrFont('vera',30,'bold')
	canvas:attrColor('black')
	canvas:drawText(70,-220, profile1)

	--canvas:attrFont('vera',30,'bold')
	--canvas:attrColor('black')
	--canvas:drawText(430,22, profile2)

	--Datos tenista 1
	canvas:attrFont('vera',30,'bold')
	canvas:attrColor('black')
	canvas:drawText(70,22, profile1)
	canvas:drawText(120,75, estatura1)
	canvas:drawText(130,128, peso1)
	canvas:drawText(100,185, camp_gan1)

	--Datos tenista 2
	canvas:attrFont('vera',30,'bold')
	canvas:attrColor('black')
	canvas:drawText(430,22, profile2)
	canvas:drawText(480,75, estatura2)
	canvas:drawText(490,128, peso2)
	canvas:drawText(460,185, camp_gan2)


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