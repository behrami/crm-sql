gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact

  @@contact_list = []
  @@next_id=1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
    @@next_id+=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes)
    new_contact = Contact.new(first_name, last_name, email, notes)
    add_phone_book(new_contact)
    return new_contact
  end

  def self.add_phone_book(contact)
    @@contact_list.push(contact)
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contact_list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contact_list.each do |contact_obj|
      if contact_obj.id == id
        return contact_obj
      end
   end
   p "no contact found"
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(search_type, replace)

      if search_type == "first_name"
          self.first_name = replace
          return self

     elsif search_type == "last_name"
         contact.last_name = replace
         return self

    elsif search_type == "email"
        contact.email = replace
        return self

    elsif search_type == "note"
        contact.email = replace
        return self
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the sattribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(search_type, search)

    if search_type == "first_name"
      @@contact_list.each do |contact|
        if contact.first_name == search
          return contact
        end
     end

   elsif search_type == "last_name"
     @@co# p contact.note = 'Loves HTML & CSS'
# p contact
puts

p test_co# p contact.note = 'Loves HTML & CSS'
# p contact
puts

p test_contact = Contact.create('Bit', 'Tester', 'bittest@gmail.com', 'Loves coding')
p test_contact2 = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
#p Contact.add_phone_book(test_contact)
#p Contact.all
Contact.find(1)
Contact.find_by("first_name", "Betty")

p test_contact2.update("first_name", "Behram")
#p Contact.delete_all

p test_contact.full_name

p test_contact.delete
ntact = Contact.create('Bit', 'Tester', 'bittest@gmail.com', 'Loves coding')
p test_contact2 = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
#p Contact.add_phone_book(test_contact)
#p Contact.all
Contact.find(1)
Contact.find_by("first_name", "Betty")

p test_contact2.update("first_name", "Behram")
#p Contact.delete_all

p test_contact.full_name

p test_contact.delete
ntact_list.each do |contact|
       if contact.last_name == search
         return contact
       end
    end

  elsif search_type == "email"
    @@contact_list.each do |contact|
      if contact.email == search
        return contact
      end
   end
  end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contact_list.clear
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contact_list.each do |contact_obj|
      if contact_obj.id == self.id
        @@contact_list.delete(self)
      end
    end

  end

  # Feel free to add other methods here, if you need them.

  # READERS
  def first_name
    return @first_name
  end

  def last_name
    return @last_name
  end

  def email
    return @email
  end

  def note
    return @note
  end

  def id
    return @id
  end

  # WRITERS
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

end
##########################################testing
# p contact = Contact.new('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# p contact.email # => 'bettymakes@gmail.com'
# # p contact.note = 'Loves HTML & CSS'
# # p contact
# puts
#
# p test_contact = Contact.create('Bit', 'Tester', 'bittest@gmail.com', 'Loves coding')
# p test_contact2 = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# #p Contact.add_phone_book(test_contact)
# #p Contact.all
# Contact.find(1)
# Contact.find_by("first_name", "Betty")
#
# p test_contact2.update("first_name", "Behram")
# #p Contact.delete_all
#
# p test_contact.full_name
#
# p test_contact.delete
