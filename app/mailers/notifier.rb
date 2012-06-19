class Notifier < ActionMailer::Base
 def activation_instructions(user)
    from          "shashank.agarwal@sumerusolutions.com"

    @account_activation_url = activate_account_url(user.perishable_token)

    mail(:to => "#{@user.name} <#{@user.email}>",
         :subject => "Activation Instructions",
         :from => "shashank.agarwal@sumerusolutions.com",
         :fail_to =>"shashank.agarwal@sumerusolutions.com"
    )
  end

  def activation_confirmation(user)
    from          "shashank.agarwal@sumerusolutions.com"

    mail(:to =>"#{@user.name} <#{@user.email}>",
         :subject => "Activation Complete",
         :from => "shashank.agarwal@sumerusolutions.com",
         :fail_to =>"shashank.agarwal@sumerusolutions.com"
    )
end
end
