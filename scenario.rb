#users
#boards
#lists
#cards
#comments
#Create 10 any unit tests for this classes and their methods

require_relative "lists"
require_relative "comments"
require_relative "cards"
require_relative "boards"
require_relative "team"
require_relative "users"



#create new user
user = Users.new
puts "========================"
puts "USER"
puts "========================"
puts user

#create new team
team = Team.new
puts "========================"
puts "THE TEAM"
puts "========================"
puts team

#add user to the team
team.members << user
puts "========================"
puts "TEAM MEMBERS"
puts "========================"
puts team.members


# add new user with a name and puts the list of all users
team.add_new_user('Tanya')
puts "========================"
puts "ALL USERS IN THE TEAM"
puts "========================"
puts team.members


#create new board
board = Boards.new
puts "========================"
puts "BOARDS"
puts "========================"
puts board

#create two new lists
list = Lists.new
done_list = Lists.new

puts "========================"
puts "INITIAL LIST"
puts "========================"
puts list
puts "========================"
puts "DONE LIST"
puts "========================"
puts done_list


#create new card
card = Cards.new
list.cards << card
puts "========================"
puts "CARDS"
puts "========================"
puts list.cards

#create new card for the first list
new_card = list.create_new_card_for_list(list)
list.cards << new_card
puts "========================"
puts "CARDs with NEW"
puts "========================"
puts list.cards

#show crads in initial list
puts "========================"
puts "CARDS in INITIAL LIST"
puts "========================"
list.show_cards_in_list(list)


#move card to other done_list
new_card.move_card_to_another_list(done_list)
puts "========================"
puts "CARD was moved from initial to done"
puts "========================"

#show cards in done_list
puts "========================"
puts "CARDS in DONE"
puts "========================"
list.show_cards_in_list(done_list)

#show crads in initial list
puts "========================"
puts "CARDS in INITIAL LIST"
puts "========================"
list.show_cards_in_list(list)



#add checklist to the card
new_checklist = card.add_checklist("Hello checklist!")
puts "========================"
puts "Checklists"
puts "========================"
puts card.checklist


#create new comment
new_comment = Comments.new
new_comment = card.add_new_comment("Hello this is comment")
puts "========================"
puts "Comments"
puts "========================"
puts card.comments


#delete comment
card.delete_comment("Hello this is comment")
puts "========================"
puts "Comments after delete"
puts "========================"
puts card.comments






