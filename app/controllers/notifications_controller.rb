class NotificationsController < ApplicationController
 
  skip_before_filter :verify_authenticity_token
 
  def notify
    debugger
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
#     params = {  
#     "session_token":"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE",
#     "order":{  
#       "failed_promo_codes":[  
#       ],
#       "parent_order_id":"SG495161754",
#       "total_amount":215,
#       "number_of_items":1,
#       "delivery_time":1432799893,
#       "address_id":198834,
#       "restaurant_id":"54f15cf6edf5cfb8a3000282",
#       "min_delivery_amount":200,
#       "restaurant_name":"SUBWAY",
#       "restaurant_area":"SEASON MALL, MAGARPATTA",
#       "delivery_duration":2700,
#       "total_discount":0,
#       "payable_amount":215,
#       "delivery_charges":0,
#       "packaging_charges":5,
#       "service_tax":0,
#       "vat":0,
#       "offers_by_restaurant":0,
#       "offers_by_tinyowl":0,
#       "offer_ids":[  

#       ],
#       "promo_codes":[  

#       ],
#       "is_gift_order":false,
#       "show_questions":false,
#       "order_status":"DRAFT",
#       "order_delivery_feedback":"DEFAULT",
#       "delivery_type":"DEFAULT",
#       "placed_from_device":false,
#       "total_offers_by_tinyowl":0,
#       "total_offers_by_restaurant":0,
#       "rewarded_tinyowl_money":0,
#       "total_rewarded_tinyowl_money":0,
#       "order_notifications":[  

#       ],
#       "is_group_order":false,
#       "discounted_amount":215,
#       "paid_by_card":0,
#       "paid_by_cod":215,
#       "paid_by_net_banking":0,
#       "paid_by_coins":0,
#       "paid_by_wallet":0,
#       "paid_by_tinyowl_money":0,
#       "cart":{  
#          "amount":210,
#          "number_of_items":1,
#          "discount":0,
#          "offers_by_restaurant":0,
#          "offers_by_tinyowl":0,
#          "total_discount":0,
#          "order_id":"40f630e1-5d87-4d2b-a9f9-f2a3de570996",
#          "order_items":[  
#             {  
#                "id":"d9e5a8bd-51c4-4c85-9899-96d911c47d9b",
#                "item_size_id":"54f15cf7edf5cfb8a3000301",
#                "item_id":"54f15cf7edf5cfb8a3000300",
#                "name":"ALOO PATTY SALAD",
#                "base_price":210,
#                "total_price":210,
#                "quantity":1,
#                "size":"NONE",
#                "offers_by_restaurant":0,
#                "offers_by_tinyowl":0,
#                "cart_id":"6bb2c3c2-ee6f-4386-8a8d-e527bb3a5b25",
#                "order_item_choices":[  
#                   {  
#                      "choice_id":"54f15cf7edf5cfb8a300029c",
#                      "choice_name":"CHOOSE YOUR SAUCE",
#                      "option_id":"54f15cf7edf5cfb8a300029d",
#                      "choice_option_name":"SWEET ONION",
#                      "number":1,
#                      "price":0,
#                      "order_item_id":"d9e5a8bd-51c4-4c85-9899-96d911c47d9b"
#                   }
#                ]
#             }
#          ]
#       }
#    },
#    "payment":{  
#       "method":"COD",
#       "sdk":"TINYOWL_DEFAULT"
#    }
# }   
#     x = RestClient.post "http://www.mcdelivery.co.in/AjaxWeb.aspx/GetSearchResultList", params, :content_type => 'application/json; charset=UTF-8'
#     result = JSON.parse(x) 
    message = client.messages.create from: '+1 980-365-8326', to: params["From"], body: 'Hello User'
    # render :plain message.stat
  end
 
end