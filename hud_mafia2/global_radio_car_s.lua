math.randomseed(getTickCount())
function random(min, max)
	return math.random(min, max)
end

local table_radio = {
	["40"] = {
		["empire"] = {
			{'boogie_woogie_bugle_boy',160.45820861678},
			{'rum_and_coca_cola',187.28596371882},
			{'sing_sing_sing_bg',186.05820861678},
			{'strip_polka_as',165.70882086168},
			{'held_for_questioning',140.50065759637},
			{'baby_its_cold_outside',138.72433106576},
			{'buttons_and_bows',120.51698412698},
			{'why_dont_you_do_right',144.18392290249},
			{'i_havent_time_to_be_a_millio',166.77984126984},
			{'ive_got_a_pocketful_of_dream',156.27861678005},
			{'let_it_snow',114.74392290249},
			{'pennies_from_heaven_bc',190.65575963719},
			{'praise_the_lord_and_pass_the',151.49820861678},
			{'straighten_up_and_fly_right',145.93412698413},
			{'the_dipsy_doodle',188.14800453515},
			{'the_pessimistic_character',147.370861678},
			{'therell_be_a_hot_time_in_the',170.20188208617},
			{'victory_polka',163.20106575964},
			{'java',115.18800453515},
			{'it_dont_mean_a_thing_if_it_a',187.54718820862},
		},
		["delta"] = {
			{'that_chicks_too_young_to_fry',141.54555555556},
			{'caldonia_boogie',159.67453514739},
			{'gi_jive_lj',176.96759637188},
			{'inflation_blues',168.94800453515},
			{'pachuko_hop',131.59290249433},
			{'ration_blues',185.45739229025},
			{'rock_around_the_clock_hs',173.17984126984},
			{'whats_the_use_of_getting_sober',175.24351473923},
			{'the_fat_man',153.48351473923},
			{'choo_choo_chboogie_lj',160.82392290249},
			{'friendship',139.690861678},
			{'did_you_ever_love',166.85820861678},
			{'thatll_get_it',163.90637188209},
			{'i_cant_lose_with_the_stuff_i',129.94718820862},
			{'everybody_eats_when_they_com',163.51453514739},
			{'aint_that_just_like_a_woman',169.78392290249},
			{'open_the_door_richard',179.78882086168},
			{'gangsters_blues',163.80188208617},
			{'mercy_mr_percy',165.63045351474},
		},
		["classic"] = {
			{'beatin_the_dog',157.71535147392},
			{'by_the_light_of_the_silv_bc',87.236984126984},
			{'clarinet_marmalade',190.02882086168},
			{'come_on_and_stomp_stomp_stom',173.41494331066},
			{'good_little_bad_little_you',159.43943310658},
			{'happy_feet',154.18882086168},
			{'riverboat_shuffle',189.95045351474},
			{'stringing_the_blues_',168.81739229025},
			{'belleville',148.57249433107},
			{'youre_driving_me_crazy_dr',171.27290249433},
			{'goin_places',176.41902494331},
			{'blue_skies',169.54882086168},
		},
	},
	["50"] = {
		["empire"] = {
			{'all_i_have_to_do_is_dream',137.73167800454},
			{'at_the_hop',155.86065759637},
			{'book_of_love',137.57494331066},
			{'cannonball',112.49739229025},
			{'come_on_lets_go',120.15126984127},
			{'donna',140.18718820862},
			{'dont_let_go',148.28514739229},
			{'forty_miles_of_bad_road',123.28596371882},
			{'moovin_and_groovin',120.43861678005},
			{'rave_on',106.56759637188},
			{'money',155.1814739229},
			{'rock_around_the_clock_bh',129.86882086168},
			{'why_do_fools_fall_in_love',136.92188208617},
			{'stood_up',109.96351473923},
			{'summertime_blues',114.53494331066},
			{'tequila',130.33902494331},
			{'come_softly_to_me',141.4933106576},
			{'you_can_have_her',162.41739229025},
			{'cmon_everybody',112.73249433107},
			{'mr_sandman',141.72841269841},
			{'maybe',153.66637188209},
			{'not_fade_away',135.32841269841},
			{'rebel_rouser',142.61657596372},
			{'sh_boom_cc',164.45494331066},
			{'teen_beat',140.73575963719},
			{'thatll_be_the_day',133.97004535147},
		},
		["delta"] = {
			{'aint_that_a_shame',142.87780045351},
			{'bo_diddley',162.52188208617},
			{'framed',163.17494331066},
			{'boom_boom',157.84596371882},
			{'honey_love',142.32922902494},
			{'no_particular_place_to_go',160.45820861678},
			{'i_put_a_spell_on_you',144.39290249433},
			{'in_the_still_of_the_night',179.13575963719},
			{'got_my_mojo_working',166.28351473923},
			{'keep_a_knockin',135.01494331066},
			{'long_tall_sally',127.23045351474},
			{'ling_ting_tong',126.73412698413},
			{'lucille',143.13902494331},
			{'mannish_boy',173.78065759637},
			{'one_kiss_led_to_another',138.56759637188},
			{'rags_to_riches_jw',158.29004535147},
			{'nadine',150.89739229025},
			{'speedo',136.97412698413},
			{'smokestack_lightning',182.42718820862},
			{'who_do_you_love',146.45657596372},
		},
		["classic"] = {
			{'makin_whoopee_dd',214.42718820862},
			{'auf_wiedersehn_sweetheart',169.07861678005},
			{'count_every_star_ah',167.06718820862},
			{'let_the_good_times_roll',133.00351473923},
			{'mambo_italiano',149.09494331066},
			{'manhattan_spiritual',161.94718820862},
			{'ooh_baby_ooh',156.30473922902},
			{'oh_marie',144.31453514739},
			{'when_youre_smiling',235.74310657596},
			{'pennies_from_heaven_lp',137.28759637188},
			{'my_guardian_angel',169.6533106576},
			{'thats_amore',184.96106575964},
			{'aint_that_a_kick_in_the_head',141.98963718821},
			{'900_miles',148.80759637188},
			{'peanut_vendor',156.93167800454},
			{'after_the_lights_go_down_low',150.24433106576},
			{'jezebel',189.42800453515},
			{'che_la_luna',151.28922902494},
			{'springtime_in_monaco',157.97657596372},
			{'chow_mein',130.96596371882},
			{'the_closer_to_the_bone',249.37902494331},
			{'return_to_me',141.28433106576},
			{'my_bonnie_lassie',143.45249433107},
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

local radio_season = "all"--40,50,all
local sound = {
	["delta"] = {},
	["classic"] = {},
	["empire"] = {},
}

function setRadioRandom(wave_radio)
	local year = radio_season

	if radio_season == "all" then
		local randomize = random(1,2)
		if randomize == 1 then
			year = "40"
		else
			year = "50"
		end
	end

	local music = random(1,#table_radio[year][wave_radio])
	sound[wave_radio][1] = year
	sound[wave_radio][2] = wave_radio
	sound[wave_radio][3] = music
	sound[wave_radio][4] = table_radio[year][wave_radio][music][1]
	sound[wave_radio][5] = getTickCount()
	sound[wave_radio][6] = 0

	triggerClientEvent( getElementsByType( "player" ), "event_setRadioSound", root, wave_radio, sound[wave_radio] )
end

for k,v in pairs({"delta","empire","classic"}) do
	setRadioRandom(v)
end

addEvent( "event_onPlayerJoin", true )
addEventHandler( "event_onPlayerJoin", getRootElement(), 
function () 
--The source of this event is the player who joined.
--This event is not cancellable.
	for k,v in pairs({"delta","empire","classic"}) do
		triggerClientEvent( source, "event_setRadioSound", root, v, sound[v] )
	end
end)

setTimer( function ( ... )
	for k,v in pairs({"delta","empire","classic"}) do
		if (getTickCount()-sound[v][5])/1000 >= table_radio[sound[v][1]] [sound[v][2]] [sound[v][3]] [2] then
			setRadioRandom(v)
		else
			sound[v][6] = (getTickCount()-sound[v][5])/1000
		end
	end
end, 100, 0 )