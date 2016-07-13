#users
#boards
#lists
#cards
#comments
#Create 10 any unit tests for this classes and their methods

require 'test/unit'
require_relative "lists"
require_relative "comments"
require_relative "cards"
require_relative "boards"
require_relative "team"
require_relative "users"


class TestTrello < Test::Unit::TestCase

  def setup
    @user = Users.new
    @team = Team.new
    @list = Lists.new
    @done_list = Lists.new
    @board = Boards.new
    @card = Cards.new
    @new_comment = Comments.new
    @new_card = @list.create_new_card_for_list(@list)
  end

#create new user
def test_create_user
  @user
  puts "========================"
  puts "USER"
  puts "========================"
  assert(@user.is_a? Users)
  puts @user
end

#create new team
def test_create_team
@team
puts "========================"
puts "THE TEAM"
puts "========================"
puts @team
end

#add user to the team
  def test_add_user_to_team
@team.members << @user
puts "========================"
puts "TEAM MEMBERS"
puts "========================"
assert(@team.members.include?(@user))
puts @team.members
end


# add new user with a name and puts the list of all users
def test_named_user
  @team.add_new_user('Tanya')
puts "========================"
puts "ALL USERS IN THE TEAM"
puts "========================"
  assert(@team.members.any? { |user| user.first_name == "Tanya" })
puts @team.members
end


#create new board
def test_new_board
@board
puts "========================"
puts "BOARDS"
puts "========================"
puts @board
end

#create two new lists
  def test_create_two_lists
@list
@done_list
puts "========================"
puts "INITIAL LIST"
puts "========================"
puts @list
puts "========================"
puts "DONE LIST"
puts "========================"
puts @done_list
end


#create new card
  def test_create_new_card
@card
@list.cards << @card
puts "========================"
puts "CARDS"
puts "========================"
assert(@list.cards.include?(@card))
puts @list.cards
end

#create new card for the first list
  def test_create_new_card_for_list
    @new_card
@list.cards << @new_card
puts "========================"
puts "CARDs with NEW"
puts "========================"
    assert(@list.cards.include?(@new_card))
puts @list.cards
end

#show crads in initial list
  def test_show_cards_in_initial_list
puts "========================"
puts "CARDS in INITIAL LIST"
puts "========================"
@new_card
@list.cards << @new_card
@list.show_cards_in_list(@list)
assert(@list.cards.any? { |card| card.current_list == @list })
end


#move card to other done_list
def test_move_card_to_done_list
  @new_card.move_card_to_another_list(@done_list)
puts "========================"
puts "CARD was moved from initial to done"
puts "========================"
  assert(@new_card.current_list == @done_list)
end


#add checklist to the card
  def test_add_checklist_to_card
new_checklist = @card.add_checklist("Hello checklist!")
puts "========================"
puts "Checklists"
puts "========================"
assert(@card.checklist.include?("Hello checklist!"))
puts @card.checklist
end


#create new comment
  def test_create_new_comment
@new_comment = @card.add_new_comment("Hello this is comment")
puts "========================"
puts "Comments"
puts "========================"
assert(@card.comments.include?("Hello this is comment"))
puts @card.comments
end


#delete comment
  def test_delete_comment
    @new_comment = @card.add_new_comment("Hello this is comment for delete")
@card.delete_comment("Hello this is comment for delete")
puts "========================"
puts "Comments after delete"
puts "========================"
    assert(@card.comments.empty?)
puts @card.comments
  end

  end




