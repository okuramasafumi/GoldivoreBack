#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/application'

require 'pry'
require 'pry-byebug'

Goldivore::Application.start(:db)
Goldivore::Application.start(:persistence)

container = Goldivore::Application['container']
relations = container.relations

servers = [
  { name: 'Amnennar', region: 'French' },
  { name: 'Ashbringer', region: 'English' },
  { name: 'Auberdine', region: 'French' },
  { name: 'Bloodfang', region: 'English' },
  { name: 'Celebras', region: 'German' },
  { name: 'Chromie', region: 'Russian' },
  { name: 'Dragon\'s Call', region: 'German' },
  { name: 'Dragonfang', region: 'English' },
  { name: 'Dreadmist', region: 'English' },
  { name: 'Earthshaker', region: 'English' },
  { name: 'Everlook', region: 'German' },
  { name: 'Finkle', region: 'French' },
  { name: 'Firemaw', region: 'English' },
  { name: 'Flamegor', region: 'Russian' },
  { name: 'Flamelash', region: 'English' },
  { name: 'Gandling', region: 'English' },
  { name: 'Gehennas', region: 'English' },
  { name: 'Golemagg', region: 'English' },
  { name: 'Harbinger of Doom', region: 'Russian' },
  { name: 'Heartstriker', region: 'German' },
  { name: 'Hydraxian Waterlords', region: 'English' },
  { name: 'Judgement', region: 'English' }
]

expansions = [
  { name: 'Classic', rank: 1 },
  { name: 'The Burning Crusade', rank: 2 }
]

raids = [
  { name: 'Molten Core', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Zul\'Gurub', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Onyxia\'s Lair', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Blackwing Lair', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Ruins of Ahn\'Qiraj', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Temple of Ahn\'Qiraj', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
  { name: 'Naxxramas', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset }
]

encounters = [
  { rank: 1, name: 'Onyxia', wow_id: 10_184,
    raid_id: relations[:raids].where(name: 'Onyxia\'s Lair').select(:id).dataset },
  { rank: 1, name: 'High Priestess Jeklik', wow_id: 14_517,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 2, name: 'High Priest Venoxis', wow_id: 14_507,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 3, name: 'High Priestess Mar\'li', wow_id: 14_510,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 4, name: 'High Priest Thekal', wow_id: 14_509,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 5, name: 'High Priestess Arlokk', wow_id: 14_515,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 6, name: 'Bloodlord Mandokir', wow_id: 11_382,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 7, name: 'Jin\'do the Hexxer', wow_id: 11_380,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 8, name: 'Gahz\'ranka', wow_id: 15_114,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 9, name: 'Edge of Madness', wow_id: nil,
    raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  { rank: 10, name: 'Hakkar', wow_id: 14_834, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset }
]

warcraft_item_database = JSON.parse(File.read('./data/items.json'))

encounter_items = encounters.each_with_object({}) do |encounter, acc|
  acc[encounter[:name]] =
    warcraft_item_database.select do |y|
      y['tooltip'].any? do |x|
        x['label'].start_with? "Dropped by: #{encounter[:name]}"
      end
    end
end.flat_map do |encounter, selected_items|
  selected_items.map do |item|
    {
      name: item['name'],
      icon: item['icon'],
      quality: item['quality'],
      wow_id: item['itemId'],
      encounter_id: relations[:encounters].where(name: encounter).select(:id).dataset
    }
  end
end

Pry.start

relations[:servers].multi_insert(servers)
relations[:expansions].multi_insert(expansions)
relations[:raids].multi_insert(raids)
relations[:encounters].multi_insert(encounters)
relations[:items].multi_insert(encounter_items)

Pry.start
