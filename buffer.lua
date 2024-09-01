random_province = {
            save_scope_as = random_province_5
        }
        create_character = {
			location = scope:random_province_5
			template = warframe_character_template
			save_scope_as = new_commander_5
		}		
		scope:new_commander_5 = {
            create_dynamic_title = {
				tier = kingdom
				name = SI_HOST_NAME
			}
			
			create_title_and_vassal_change = {
				type = created
				save_scope_as = change
			}
			
			scope:new_title = {
				set_capital_county = title:c_vathmora
				set_landless_title = yes
				set_destroy_on_succession = yes
				set_delete_on_destroy = yes
				generate_coa = yes
				set_definitive_form = yes
				change_title_holder = {
					holder = scope:new_commander_5
					change = scope:change
				}
			}
            resolve_title_and_vassal_change = scope:change
            scope:random_province_5.county.holder.top_liege = {
				save_scope_as = war_target
			}
            start_war = {
				cb = si_landing_war
				target = scope:war_target
				target_title = scope:random_province_5.county
			}
            spawn_army = {
                name = "Hyldrin"
                men_at_arms = {
                    type = acs_first_unit
                    stacks = 1
                }
                location = scope:random_province_5
                origin = scope:random_province_5
                inheritable = no
                uses_supply = no
            }
            while = {
				count = 5
				spawn_army = {
					uses_supply = no
					inheritable = no
					name = "risen_dead"
					levies = {
						value = {
							value = 750
						}
					}
					location = scope:random_province_5
				}
			}
            every_player = {
				send_interface_message = {
					type = event_generic_bad
					title = INVASION_ANOTHER_LANDING_MESSAGE_TITLE
					desc = INVASION_ANOTHER_LANDING_MESSAGE_DESC
					right_icon = scope:new_commander_5
				}
			}
		}