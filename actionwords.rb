# encoding: UTF-8

module Actionwords
  def i_start_the_coffee_machine_using_language_lang(lang = "en")
    # TODO: Implement action: "Start the coffee machine using language #{lang}"
    raise NotImplementedError
  end

  def i_shutdown_the_coffee_machine
    # TODO: Implement action: "Shutdown coffee machine"
    raise NotImplementedError
  end

  def message_message_should_be_displayed(message = "")
    # TODO: Implement result: "Displayed message is \"#{message}\""
    raise NotImplementedError
  end

  def coffee_should_be_served
    # TODO: Implement result: "Coffee is served :)"
    raise NotImplementedError
  end

  def coffee_should_not_be_served
    # TODO: Implement result: "No coffee is served :("
    raise NotImplementedError
  end

  def i_take_a_coffee
    # TODO: Implement action: "Take a coffee"
    raise NotImplementedError
  end

  def i_empty_the_coffee_grounds
    # TODO: Implement action: "Empty coffee grounds"
    raise NotImplementedError
  end

  def i_fill_the_beans_tank
    # TODO: Implement action: "Fill beans"
    raise NotImplementedError
  end

  def i_fill_the_water_tank
    # TODO: Implement action: "Fill water tank"
    raise NotImplementedError
  end

  def i_take_coffee_number_coffees(coffee_number = 10)

  end

  def the_coffee_machine_is_started
    i_start_the_coffee_machine_using_language_lang
  end

  def i_handle_everything_except_the_water_tank
    i_handle_coffee_grounds
    i_handle_beans
  end

  def i_handle_water_tank

  end

  def i_handle_beans

  end

  def i_handle_coffee_grounds

  end

  def i_handle_everything_except_the_beans
    i_handle_water_tank
    i_handle_coffee_grounds
  end

  def i_handle_everything_except_the_grounds
    i_handle_water_tank
    i_handle_beans
  end

  def displayed_message_is(__free_text = "")
    message_message_should_be_displayed(__free_text)
  end

  def i_switch_to_settings_mode

  end

  def settings_should_be(__datatable = "||")

  end
end