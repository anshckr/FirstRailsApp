class NotificationsController < ApplicationController
 
  skip_before_filter :verify_authenticity_token
 
  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    if params["From"].nil?
      to = '+19717173952'
    else 
      to = params["From"]
    end
    oOrder = {  
   "session_token":"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE",
   "order":{  
      "failed_promo_codes":[  
      ],
      "parent_order_id":"SG495161754",
      "total_amount":215,
      "number_of_items":1,
      "delivery_time":1432799893,
      "address_id":198834,
      "restaurant_id":"54f15cf6edf5cfb8a3000282",
      "min_delivery_amount":200,
      "restaurant_name":"SUBWAY",
      "restaurant_area":"SEASON MALL, MAGARPATTA",
      "delivery_duration":2700,
      "total_discount":0,
      "payable_amount":215,
      "delivery_charges":0,
      "packaging_charges":5,
      "service_tax":0,
      "vat":0,
      "offers_by_restaurant":0,
      "offers_by_tinyowl":0,
      "offer_ids":[  

      ],
      "promo_codes":[  

      ],
      "is_gift_order":false,
      "show_questions":false,
      "order_status":"DRAFT",
      "order_delivery_feedback":"DEFAULT",
      "delivery_type":"DEFAULT",
      "placed_from_device":false,
      "total_offers_by_tinyowl":0,
      "total_offers_by_restaurant":0,
      "rewarded_tinyowl_money":0,
      "total_rewarded_tinyowl_money":0,
      "order_notifications":[  

      ],
      "is_group_order":false,
      "discounted_amount":215,
      "paid_by_card":0,
      "paid_by_cod":215,
      "paid_by_net_banking":0,
      "paid_by_coins":0,
      "paid_by_wallet":0,
      "paid_by_tinyowl_money":0,
      "cart":{  
         "amount":210,
         "number_of_items":1,
         "discount":0,
         "offers_by_restaurant":0,
         "offers_by_tinyowl":0,
         "total_discount":0,
         "order_id":"40f630e1-5d87-4d2b-a9f9-f2a3de570996",
         "order_items":[  
            {  
               "id":"d9e5a8bd-51c4-4c85-9899-96d911c47d9b",
               "item_size_id":"54f15cf7edf5cfb8a3000301",
               "item_id":"54f15cf7edf5cfb8a3000300",
               "name":"ALOO PATTY SALAD",
               "base_price":210,
               "total_price":210,
               "quantity":1,
               "size":"NONE",
               "offers_by_restaurant":0,
               "offers_by_tinyowl":0,
               "cart_id":"6bb2c3c2-ee6f-4386-8a8d-e527bb3a5b25",
               "order_item_choices":[  
                  {  
                     "choice_id":"54f15cf7edf5cfb8a300029c",
                     "choice_name":"CHOOSE YOUR SAUCE",
                     "option_id":"54f15cf7edf5cfb8a300029d",
                     "choice_option_name":"SWEET ONION",
                     "number":1,
                     "price":0,
                     "order_item_id":"d9e5a8bd-51c4-4c85-9899-96d911c47d9b"
                  }
               ]
            }
         ]
      }
   },
   "payment":{  
      "method":"COD",
      "sdk":"TINYOWL_DEFAULT"
   }
}
    # orderJSON = oOrder.to_json
    
    # orderResponse = RestClient.post "http://res-product.tinyowl.com/restaurant/api/v1/restaurants/54f15cf6edf5cfb8a3000282/order", orderJSON, :content_type => :json, :accept => :json
    # orderHash = JSON.parse orderResponse
    # orderText = params[:Body].from(params[:Body].index('-') + 2).to(-1)
    
    oDishes = {
"locality_id": 7966,
"device_id":"sasdfafafaf",
"app_version":"3.3.6",
"platform":"ANDROID",
"dishes":{
     "token": {
       "valid_until": 1411204180,
         "start_index":1,
       "network": "3G",
       "more": true
     },
 "image_width": 800,
     "dpi": 2
 },
"restaurants": {
       "width": 400,
     "token":{
       "valid_until": 1411204180,
       "start_index": 1,
       "network": "3G",
       "more": true
     },
   "sort_by": "delivery_time",
     "filter_by": {
         "cuisines": [],
         "cost_for_two_ranges": []
     },
     "dpi": 2
}
}
    oDishesJSON = oDishes.to_json
    debugger
    dishesResponse = JSON.parse(RestClient.post("http://app-tech-2.tinyowl.com/restaurant/api/v1/feed", oDishesJSON, :content_type => :json, :accept => :json)) 
    # dishesResponseTwo = RestClient.get 'http://app-tech-2.tinyowl.com/restaurant/api/v1/search_dishes?input=chick&locality_id=7966&width=800', {:accept => :json}

    debugger
    # if orderText.include? "hungry"
    #   message = client.messages.create from: '+1 980-365-8326', to: to, body: 'Your order placed at time:' + Time.at(orderHash["created_at"]).strftime("%H:%M") + ', Your order id is: ' + orderHash["order_id"] + ', Expected to be delivered at time: ' + Time.at(orderHash["delivery_time"]).strftime("%H:%M") + ', Thanks for ordering with Tinyowl'
    #   # render plain: message.status
    # else
    #   message = client.messages.create from: '+1 980-365-8326', to: to, body: 'Incorrect format to place order, please follow the format -> hungry <pincode> <dish>'
    #   # render plain: message.body
    # end
  end
 
end