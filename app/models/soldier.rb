class Soldier < ActiveRecord::Base



  has_many :soldier_battlefields
  has_many :battlefields, through: :soldier_battlefields

  after_initialize :init

  def arr_abilities
    ["counter", "aim", "kiss", "sleep"]
  end



  def init
    self.hp = 10
    self.ability = arr_abilities.sample
    self.level = 1

  end

  def soldier_attack
     attack = if monster_menu == "Attack"
      Battlefield.all.first.monster.hp -= 1
    end
    puts "attack successfull current hp is now #{attack}"
  end

  # def win
  #   # based on monster hp i will attack first
  #   # i will hit him with my attack power minus his hp
  #   # then find that monster based on that battlefield which is based on soldier_battlefields id
  #   # he will then use his ability intilaized number to hit me and i will lose hp
  #   # then I will use my secret weapon to attack him and take out all his hp
  #   # then if my hp is greater than 0 and his is zero or less then he will die
  #   soldier = Soldier
  # end



  # def next_level
  #   i am in a certain level, equal to a varible
  #   then i will go to next level only if i win. last method win will be put here
  #   if i win i will go to level plus 1 that will also equal out to battlefield_id number or add to the previous id
  #     now on next level
  #     keep repeating if i win only
  #     if i lose goes to start that level
  # end
  #
  # def last_level
  #   if i started game i am level 1 which equals battlefield id to equal that number to give us that battlefield name
  #     if i have already fought then
  # end


end
