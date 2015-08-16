local MoverUpdate = {}
MoverUpdate.name = "MoverUpdate"

function MoverUpdate:initObject(obj)
	
end

function MoverUpdate:update(dt)
end

function MoverUpdate:updateObject(obj, dt)	
	if obj.mapXfer then
		local wp = NoxMap.Waypoints[obj.mapXfer.WaypointID]
		local movingObject = NoxMap:GetByExtendId(obj.mapXfer.MovedObjExtent)

		local dx = wp.Point.X - movingObject.x
		local dy = wp.Point.Y - movingObject.y

		local length = math.sqrt(dx * dx + dy * dy)

		if length == 0 then
			if wp.connections[1] then
				obj.mapXfer.WaypointID = wp.connections[1].wp_num
				return MoverUpdate:updateObject(obj, dt)
				--[[local wp = NoxMap.Waypoints[wp.connections[1].wp_num]


				
				local dx = wp.Point.X - movingObject.x
				local dy = wp.Point.Y - movingObject.y

				local length = math.sqrt(dx * dx + dy * dy)

				local dx = dx / length
				local dy = dy / length

				local targetx = movingObject.x + dx * obj.mapXfer.MovingSpeed * dt
				local targety = movingObject.y + dy * obj.mapXfer.MovingSpeed * dt

				movingObject:setPosition(targetx, targety )--]]

			end

		elseif length < obj.mapXfer.MovingSpeed * dt then
			movingObject:setPosition(wp.Point.X, wp.Point.Y)
		else
			local dx = dx / length
			local dy = dy / length

			local targetx = movingObject.x + dx * obj.mapXfer.MovingSpeed * dt
			local targety = movingObject.y + dy * obj.mapXfer.MovingSpeed * dt

			movingObject:setPosition(targetx, targety )
		end

		
	end
end


return MoverUpdate
