class UserMailer < ActionMailer::Base

     
  default :from => "shashank.agarwal@sumerusolutions.com"
  def welcome_user(user)
    @user = user
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Welcome")
  end
  #  def initialize(method_name,request,*params)
  #
  #    @host=request.host_with_port
  #    super(method_name, *params)
  #
  #  end
  #
  #  def url_for(user)
  #    url_for_without_host(params.update(:host => @host))
  #  end
  #
  #  alias_method_chain :url_for, :host
  #
  #  def doit(param1,param2)
  #    body :link => url_for(:controller => :user, :action => :rego)
  #  end


end

