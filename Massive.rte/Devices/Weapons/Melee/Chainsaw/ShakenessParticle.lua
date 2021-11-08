function Create(self)

	self.shakeTable = {}
	for actor in MovableMan.Actors do
		actor = ToActor(actor)
		table.insert(self.shakeTable, actor);
	end
	
	self.shake = math.floor(60 * MassiveSettings.GlobalShakeMultiplier)
	
	self.ToSettle = false
end
function Update(self)
	local factor = math.min(self.Age/11000, 1)
	
	-- Shake
	if self.shakeTable then
		for i = 1, #self.shakeTable do
			local actor = self.shakeTable[i];
			if actor and IsActor(actor) then
				actor = ToActor(actor)
				local dist = SceneMan:ShortestDistance(self.Pos, actor.Pos, SceneMan.SceneWrapsX).Magnitude
				local distFactor = math.sqrt(1 + dist * 0.03)
				
				actor.ViewPoint = actor.ViewPoint + Vector(self.shake * RangeRand(-1, 1), self.shake * RangeRand(-1, 1)) * factor / distFactor;
			end
		end
	end
	
	self.ToSettle = false
	--self.ToDelete = true;
end