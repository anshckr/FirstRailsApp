module ApplicationHelper
 require 'sqlite3'
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def find_locality(pincode)
    
    db = SQLite3::Database.open "/Users/anshul/Downloads/to_poor.db"
        
    count = db.get_first_value "SELECT COUNT(locality) FROM Map_pincode WHERE pincode='#{pincode}'"

        if count != 0
           stm = db.get_first_value "SELECT locality FROM  Map_pincode WHERE pincode='#{pincode}'"
           re = stm

           return stm 
        
        else return 0
        end
    
        ensure
            db.close if db
        end
  end