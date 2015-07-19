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

music = {}

music.currentMusic = nil

function music:playByNr(nr, volume)
	if(music.currentMusic) then
		music.currentMusic:stop()
	end
	print("music/" .. defaultmusic[nr + 1] .. ".wav")
	music.currentMusic = love.audio.newSource("content/music/" .. defaultmusic[nr] .. ".MP3", "stream")
	music.currentMusic:setVolume(volume / 100 * gameconf.musicvolume)
	music.currentMusic:setLooping(true)
	music.currentMusic:play()
end