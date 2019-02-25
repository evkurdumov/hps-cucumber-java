# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Coffee machine - Hiptest publisher sample' do
  include Actionwords

  it "Message \"Fill water tank\" is displayed after 50 coffees are taken" do
    # Tags: priority:high
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
  end

  it "Message \"Fill beans\" is displayed after 38 coffees are taken" do
    # Tags: priority:high
    # When I take "38" coffees
    i_take_coffee_number_coffees(38)
    # Then message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "It is possible to take 10 coffees after the message \"Fill water tank\" is displayed" do
    # Tags: priority:low
    # When I take "60" coffees
    i_take_coffee_number_coffees(60)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  it "It is possible to take 40 coffees before there is really no more beans" do
    # Tags: priority:low
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "Display settings" do
    # Tags: priority:medium
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then displayed message is:
    displayed_message_is("Settings:\n - 1: water hardness\n - 2: grinder")
  end

  it "Message \"Empty grounds\" is displayed after 30 coffees are taken" do
    # Tags: priority:high
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
  end

  context "Messages are based on language" do
    def messages_are_based_on_language(language, ready_message)
      # Tags: priority:medium
      # When I start the coffee machine using language "<language>"
      i_start_the_coffee_machine_using_language_lang(language)
      # Then message "<ready_message>" should be displayed
      message_message_should_be_displayed(ready_message)
    end

    it "English" do
      messages_are_based_on_language('en', 'Ready')
    end

    it "French" do
      messages_are_based_on_language('fr', 'Pret')
    end
  end

  it "Simple use" do
    # Well, sometimes, you just get a coffee.
    # Tags: priority:high
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
  end

  it "Full grounds does not block coffee" do
    # You keep getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    # Tags: priority:low
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the grounds
    i_handle_everything_except_the_grounds
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # And coffee should be served
    coffee_should_be_served
  end

  it "When the water tank is filled, the message disappears" do
    # Tags: priority:high
    # When I take "55" coffees
    i_take_coffee_number_coffees(55)
    # And I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "After adding beans, the message \"Fill beans\" disappears" do
    # Tags: priority:high
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # And I fill the beans tank
    i_fill_the_beans_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "When the grounds are emptied, message is removed" do
    # Tags: priority:medium
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # And I empty the coffee grounds
    i_empty_the_coffee_grounds
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  it "No messages are displayed when machine is shut down" do
    # Tags: priority:medium
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end

  it "Default settings" do
    # Tags: priority:high
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then settings should be:
    settings_should_be("| water hardness | 2      |\n| grinder        | medium |")
  end
end
