local TEXT = 'Hola Ginga'

function redraw ()
	canvas:attrColor('green')
	canvas:drawRect('fill', 0,0, 100,100)

	canvas:attrColor('black')
	canvas:drawText(0,0, TEXT)
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