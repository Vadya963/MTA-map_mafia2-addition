local table_radio = {
	["40"] = {
		["empire"] = {
			"boogie_woogie_bugle_boy",
			"rum_and_coca_cola",
			"sing_sing_sing_bg",
			"strip_polka_as",
			"held_for_questioning",
			"baby_its_cold_outside",
			"buttons_and_bows",
			"why_dont_you_do_right",
			"i_havent_time_to_be_a_millio",
			"ive_got_a_pocketful_of_dream",
			"let_it_snow",
			"pennies_from_heaven_bc",
			"praise_the_lord_and_pass_the",
			"straighten_up_and_fly_right",
			"the_dipsy_doodle",
			"the_pessimistic_character",
			"therell_be_a_hot_time_in_the",
			"victory_polka",
			"java",
			"it_dont_mean_a_thing_if_it_a",
		},
		["delta"] = {
			"that_chicks_too_young_to_fry",
			"caldonia_boogie",
			"gi_jive_lj",
			"inflation_blues",
			"pachuko_hop",
			"ration_blues",
			"rock_around_the_clock_hs",
			"whats_the_use_of_getting_sober",
			"the_fat_man",
			"choo_choo_chboogie_lj",
			"friendship",
			"did_you_ever_love",
			"thatll_get_it",
			"i_cant_lose_with_the_stuff_i",
			"everybody_eats_when_they_com",
			"aint_that_just_like_a_woman",
			"open_the_door_richard",
			"gangsters_blues",
			"mercy_mr_percy",
		},
		["classic"] = {
			"beatin_the_dog",
			"by_the_light_of_the_silv_bc",
			"clarinet_marmalade",
			"come_on_and_stomp_stomp_stom",
			"good_little_bad_little_you",
			"happy_feet",
			"riverboat_shuffle",
			"stringing_the_blues_",
			"belleville",
			"youre_driving_me_crazy_dr",
			"goin_places",
			"blue_skies",
		},
	},
	["50"] = {
		["empire"] = {
			"all_i_have_to_do_is_dream",
			"at_the_hop",
			"book_of_love",
			"cannonball",
			"come_on_lets_go",
			"donna",
			"dont_let_go",
			"forty_miles_of_bad_road",
			"moovin_and_groovin",
			"rave_on",
			"money",
			"rock_around_the_clock_bh",
			"why_do_fools_fall_in_love",
			"stood_up",
			"summertime_blues",
			"tequila",
			"come_softly_to_me",
			"you_can_have_her",
			"cmon_everybody",
			"mr_sandman",
			"maybe",
			"not_fade_away",
			"rebel_rouser",
			"sh_boom_cc",
			"teen_beat",
			"thatll_be_the_day",
		},
		["delta"] = {
			"aint_that_a_shame",
			"bo_diddley",
			"framed",
			"boom_boom",
			"honey_love",
			"no_particular_place_to_go",
			"i_put_a_spell_on_you",
			"in_the_still_of_the_night",
			"got_my_mojo_working",
			"keep_a_knockin",
			"long_tall_sally",
			"ling_ting_tong",
			"lucille",
			"mannish_boy",
			"one_kiss_led_to_another",
			"rags_to_riches_jw",
			"nadine",
			"speedo",
			"smokestack_lightning",
			"who_do_you_love",
		},
		["classic"] = {
			"makin_whoopee_dd",
			"auf_wiedersehn_sweetheart",
			"count_every_star_ah",
			"let_the_good_times_roll",
			"mambo_italiano",
			"manhattan_spiritual",
			"ooh_baby_ooh",
			"oh_marie",
			"when_youre_smiling",
			"pennies_from_heaven_lp",
			"my_guardian_angel",
			"thats_amore",
			"aint_that_a_kick_in_the_head",
			"900_miles",
			"peanut_vendor",
			"after_the_lights_go_down_low",
			"jezebel",
			"che_la_luna",
			"springtime_in_monaco",
			"chow_mein",
			"the_closer_to_the_bone",
			"return_to_me",
			"my_bonnie_lassie",
		},
	},
}

local radio_name = {
	[-3] = {"Радио Дельта","delta"},
	[-2] = {"Радио Классика Эмпайр","classic"},
	[-1] = {"Центральное радио Эмпайр","empire"},
	[0] = {"Радио Выкл","none"},
	[1] = {"Радио Дельта","delta"},
	[2] = {"Радио Классика Эмпайр","classic"},
	[3] = {"Центральное радио Эмпайр","empire"},
}
local radio_station = 0
local radio_season = "all"--40,50,all
local sound = {
	["delta"] = false,
	["classic"] = false,
	["empire"] = false,
}

local screenWidth, screenHeight = guiGetScreenSize ( )
local text_radio = false
local ud_timer = false

function setRadio(wave_radio)
	for k,v in pairs(sound) do
		if v then
			setSoundVolume( v, 0.0 )
		end
	end

	if wave_radio == 0 then
		return
	end

	wave_radio = radio_name[wave_radio][2]

	setSoundVolume( sound[wave_radio], 1.0 )
end

function setRadioRandom(wave_radio, reason)
	local wave_radio_number = wave_radio
	local year = radio_season

	wave_radio = radio_name[wave_radio][2]

	if radio_season == "all" then
		local randomize = random(1,2)
		if randomize == 1 then
			year = "40"
		else
			year = "50"
		end
	end

	local music = random(1,#table_radio[year][wave_radio])
	
	sound[wave_radio] = playSound( ":radio_mafia2/"..year.."/"..wave_radio.."/"..table_radio[year][wave_radio][music]..".mp3" )
	if reason == "finished" and radio_name[radio_station][2] == wave_radio then
		setSoundVolume( sound[wave_radio], 1.0 )
	else
		setSoundVolume( sound[wave_radio], 0.0 )
	end

	addEventHandler( "onClientSoundStopped", sound[wave_radio],
	function (reason) 
	--The source of this event is the sound's element.
		if reason == "finished" then
			setRadioRandom(wave_radio_number, reason)
		end
	end)

	return sound[wave_radio]
end

addEventHandler( "onClientResourceStart", resourceRoot, 
function (startedResource) 
--The source of this event is the started resource's root element.
	for i=1,3 do
		setRadioRandom(i)
	end

	bindKey ( ",", "down", function ( ... )
		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then
			if localPlayer ~= getVehicleOccupant(vehicle, 0) then return end
		else
			return
		end

		if isTimer(ud_timer) then killTimer( ud_timer ) end

		radio_station = radio_station-1

		if radio_station == -4 then 
			radio_station = 0
		end

		setRadio(radio_station)

		text_radio = radio_name[radio_station][1]

		ud_timer = setTimer( function() 
			text_radio = false
		end, 5000, 1 )
	end )

	bindKey ( ".", "down", function ( ... )
		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then
			if localPlayer ~= getVehicleOccupant(vehicle, 0) then return end
		else
			return
		end
		
		if isTimer(ud_timer) then killTimer( ud_timer ) end

		radio_station = radio_station+1

		if radio_station == 4 then 
			radio_station = 0
		end

		setRadio(radio_station)

		text_radio = radio_name[radio_station][1]

		ud_timer = setTimer( function() 
			text_radio = false
		end, 5000, 1 )
	end )
end)

addEventHandler( "onClientVehicleEnter", getRootElement(), 
function (thePlayer, seat) 
--The source of the event is the vehicle that the player entered.
	setRadioChannel( 0 )
end)
addEventHandler( "onClientVehicleExit", getRootElement(), 
function (thePlayer, seat) 
--The source of the event is the vehicle that the player exited.
	radio_station = 0
	setRadio(radio_station)

	text_radio = false
end)

addEventHandler( "onClientRender", getRootElement(), 
function () 
--The source of this event is the client's root element.
	if text_radio and not getElementData(localPlayer, "radar_mafia2") then 
		local dimension = dxGetTextWidth( text_radio, 1*height_hd, "default-bold" )
		local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )
		dxdrawtext( text_radio, screenWidth-20-dimension-(5*height_hd)-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car+(dimension_h/2), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		
		if radio_station ~= 0 then
			dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car, 30*height_hd, 30*height_hd, 357, 334, 31, 31, 'hud/hud2.png')
		else
			dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car, 30*height_hd, 30*height_hd, 314, 365, 31, 31, 'hud/hud2.png')
		end
	end
end)