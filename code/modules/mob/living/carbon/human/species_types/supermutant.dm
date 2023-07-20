/datum/species/smutant
	name = "Super Mutant"
	icon_limbs = 'icons/mob/mutie_parts.dmi'
	id = "smutant"
	say_mod = "yells"
	limbs_id = "smutant"
	species_traits = list(NOTRANSSTING,NOAROUSAL,NOGENITALS,EYECOLOR)
	inherent_traits = list(TRAIT_RADIMMUNE,TRAIT_VIRUSIMMUNE,TRAIT_SMUTANT)
	inherent_biotypes = list(MOB_HUMANOID)
	speedmod = 0.90
	siemens_coeff = 0
	punchdamagelow = 25
	punchdamagehigh = 30
	use_skintones = 0
	offset_features = list (
		OFFSET_HEAD = list(1,5),
		OFFSET_SUIT = list(0,0),
		OFFSET_BELT = list(5,0),
		OFFSET_EYES = list(1,6)
		)
	sexes = 0
	armor = 10
	liked_food = JUNKFOOD | FRIED | RAW

/datum/species/smutant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage += 80
/datum/species/smutant/on_species_loss(mob/living/carbon/C)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage = initial(b.max_damage)

/datum/species/smutant/qualifies_for_rank(rank, list/features)
	if(rank in GLOB.legion_positions) // Legion isn't a fan of muties.
		return 0
	if(rank in GLOB.brotherhood_positions) //Brother get the Flamer. The Heavy Flmaer
		return 0
	if(rank in GLOB.vault_positions) //How did they even get in here?.
		return 0
	return ..()
