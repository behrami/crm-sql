require_relative "contact.rb"

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end

  def add_new_contact

    print 'First Name: '
    first_name = gets.chomp

    print 'Last Name: '
    last_name = gets.chomp

    print 'Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact = Contact.create(
    first_name: first_name,
    last_name:  last_name,
    email:      email,
    note:       note
    )

  end

  def modify_existing_contact

    puts "Enter ID of contact"
    id = gets.chomp.to_i

    puts "Would you like to change first_name, last_name, or email?"
    attribute = gets.chomp

    puts "Enter new value for #{attribute}?"
    value = gets.chomp

    find = Contact.find(id)
    find.update(attribute, value)

  end

  def delete_contact

    puts "Enter ID of contact"
    id = gets.chomp.to_i

    find = Contact.find(id)
    find.delete

  end

  def display_all_contacts
    Contact.all.each do |user|
      puts "#{user.id}   #{user.first_name}   #{user.last_name}   #{user.email}   #{user.note}"
    end
  end

  def search_by_attribute
    puts "Find contact by first_name, last_name, or email?"
    attribute = gets.chomp

    puts "what #{attribute} of the contact are you searching for?"
    value = gets.chomp

    a = Contact.find_by(attribute, value)
    puts "#{a.id} #{a.first_name} #{a.last_name} #{a.email}"
  end


end

###############
a_crm_app = CRM.new
a_crm_app.main_menu
