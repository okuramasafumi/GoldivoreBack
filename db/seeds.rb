#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/application'

require 'pry'
require 'pry-byebug'

Goldivore::Application.start(:db)
Goldivore::Application.start(:persistence)

container = Goldivore::Application['container']
relations = container.relations


relations[:servers].multi_insert(
  [
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
)

relations[:expansions].multi_insert(
  [
    { name: 'Classic', rank: 1 },
    { name: 'The Burning Crusade', rank: 2 }
  ]
)

relations[:raids].multi_insert(
  [
    { name: 'Molten Core', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Zul\'Gurub', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Onyxia\'s Lair', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Blackwing Lair', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Ruins of Ahn\'Qiraj', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Temple of Ahn\'Qiraj', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset },
    { name: 'Naxxramas', expansion_id: relations[:expansions].where(rank: 1).select(:id).dataset }
  ]
)

relations[:encounters].multi_insert(
  [
    { rank: 1, name: 'Onyxia', wow_id: 10184, raid_id: relations[:raids].where(name: 'Onyxia\'s Lair').select(:id).dataset },
    { rank: 1, name: 'High Priestess Jeklik', wow_id: 14517, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 2, name: 'High Priest Venoxis', wow_id: 14507, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 3, name: 'High Priestess Mar\'li', wow_id: 14510, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 4, name: 'High Priest Thekal', wow_id: 14509, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 5, name: 'High Priestess Arlokk', wow_id: 14515, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 6, name: 'Bloodlord Mandokir', wow_id: 11382, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 7, name: 'Jin\'do the Hexxer', wow_id: 11380, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 8, name: 'Gahz\'ranka', wow_id: 15114, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 9, name: 'Edge of Madness', wow_id: nil, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
    { rank: 10, name: 'Hakkar', wow_id: 14834, raid_id: relations[:raids].where(name: 'Zul\'Gurub').select(:id).dataset },
  ]
)

# raw_items = JSON.parse(File.read('./data/items.json'))
# droppable_items = raw_items.select { |y| y['tooltip'].any? { |x| x['label'].start_with? 'Dropped by: Onyxia' } }

Pry.start
