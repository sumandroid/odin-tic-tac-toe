class Player

  attr_accessor :name, :token

  TOKENS = ["x", "o"]

  @@chosen_token = []

  def initialize(name, token_choice_allowed)
    @name = name
    @token_choice_allowed = token_choice_allowed
    set_token
  end

  def set_token
    if @token_choice_allowed
      puts "Hey #{@name}! Please choose your token X or O"
      @token = validate_token_input
      @@chosen_token << @token
      puts "Well done! you chose #{@token}"
    else
      remaining_token = (TOKENS - @@chosen_token).first
      puts "#{@name}, you have no choice you will begin with #{remaining_token}"
      @token = remaining_token
    end
  end

  def validate_token_input
    token_input = gets.chomp().downcase
    until TOKENS.include? token_input do
      puts "Uh oh! wrong token, valid tokens are 'X' or 'O'"
      token_input = gets.chomp().downcase
    end
    token_input
  end

end