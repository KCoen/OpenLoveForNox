local defaultmusic = {
	"chap1",
	"chap2wiz",
	"chap2con",
	"chap2war",
	"chap3",
	"chap4",
	"chap5",
	"chap6",
	"chap7",
	"chap8",
	"chap9",
	"chapa",
	"chapb",
	"title",
	"town1",
	"town2",
	"town3",
	"sub1",
	"sub2",
	"sub3",
	"wander1",
	"wander2",
	"wander3",
	"credits",
	"shell",
	"action1",
	"action2",
	"action",
	"wander4"
}

audio = {}

audio.currentMusic = nil

function audio:playMusicByNr(nr, volume)
	if nr == 0 then
		return
	end
	if(audio.currentMusic) then
		audio.currentMusic:stop()
	end
	print("music/" .. defaultmusic[nr] .. ".wav")
	audio.currentMusic = love.audio.newSource("content/music/" .. defaultmusic[nr] .. ".MP3", "stream")
	audio.currentMusic:setVolume(volume / 100 * gameconf.musicvolume)
	audio.currentMusic:setLooping(true)
	audio.currentMusic:play()
end


function audio:playSoundByRawName(name)
	local snd = love.audio.newSource("content/audio/" .. name .. ".MP3", "stream")
	snd:setVolume(1.0 * gameconf.volume)
	snd:setLooping(false)
	snd:play()

	return snd
end

function audio:playSoundByMapping(name)
	local thingy = ThingDB.AudioMappings[name]
	if thingy then
		local sndname = thingy.Sounds[math.random(1, #thingy.Sounds)]
		return audio:playSoundByRawName(sndname:split(".")[1])
	else
		print("Could not find sound mapping " .. name)
	end
end

function audio:emitSoundByMapping(obj, name) -- Placeholder for future multiplayer
	return self:playSoundByMapping(name)
end



--uinveop.MP3