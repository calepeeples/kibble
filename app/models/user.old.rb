class User < ActiveRecord::Base
  # has_no_table
  # column :email, :string
  # column :first_name, :string
  # column :last_name, :string
  # column :password, :string
  # column :tel, :string
  # column :birthday, :date
  # column :ssn, :string
  # validates_presence_of :email, :first_name, :last_name, :password, :tel, :birthday, :ssn
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  def subscribe
    # mailchimp = Gibbon::API.new
    # result = mailchimp.lists.subscribe({
    #   :id => ENV['MAILCHIMP_LIST_ID'],
    #   :email => {:email => self.email},
    #   :double_optin => false,
    #   :update_existing => true,
    #   :send_welcome => true
    # })
    # Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
    
    # mandrill without templates
    # require 'mandrill' 
    # m = Mandrill::API.ne
    # message = {  
    #  :subject=> "Hello from the Mandrill API",  
    #  :from_name=> "The Grand Rounds Team",  
    #  :text=>"Hi message, how are you?",  
    #  :to=>[  
    #    {  
    #      :email=> self.email,  
    #      :name=> "Recipient1"  
    #    }  
    #  ],  
    #  :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
    #  :from_email=>"sender@yourdomain.com"  
    # }  
    # sending = m.messages.send message  
    # puts sending
    
    #template
    require 'mandrill'
    @message = {
      :from_name=> "Admin",
      :from_email=>"admin@somewhere.com",
      :subject=> "Welcome to Grand Rounds",
      :to=>[
            {
              :email=> self.email,
              :name=> self.first_name
            }
           ],
      :auto_text => true,
      :global_merge_vars => [
                             {
                               :name => "LISTCOMPANY",
                               :content => "Company Name Here"
                             }
                            ]
    }

    true
    
    m = Mandrill::API.new

    sending = m.messages.send_template('Grand Rounds Welcome',
                                       [
                                        {
                                          :name => 'main',
                                          :content => "test"
                                        },
                                        {
                                          :name => 'unsub',
                                          :content => "test"
                                        }
                                       ],
                                       message = @message)
    Rails.logger.info sending
    
  end

end
