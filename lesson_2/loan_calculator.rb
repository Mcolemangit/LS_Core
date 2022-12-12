require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(message)
  puts "#{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

loop do # main loop
  loan_amount = ''
  loop do
    prompt(MESSAGES['welcome'])
    loan_amount = gets.chomp

    if number?(loan_amount)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  loan_duration = ''
  loop do
    prompt(MESSAGES['duration'])
    loan_duration = gets.chomp.split

    if loan_duration.any? { |x| ['month', 'months', 'year', 'years'].include? x }
      break
    else
      prompt(MESSAGES['invalid2'])
    end
  end

  length = loan_duration[0].to_f

  interest = ''
  loop do
    prompt(MESSAGES['apr'])
    interest = gets.chomp

    if number?(interest)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  apr = interest.to_f

  monthly_apr = (apr / 100) / 12

  if loan_duration.include?('year') || loan_duration.include?('years')
    
    months = length * 12
    monthly_payment = loan_amount.to_i * (monthly_apr / (1 - (1 + monthly_apr)**(-months)))
  else
    monthly_payment = loan_amount.to_i * (monthly_apr / (1 - (1 + monthly_apr)**(-length)))
  end

  puts " Your monthly payment is #{monthly_payment}."

  prompt(MESSAGES['again'])
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end