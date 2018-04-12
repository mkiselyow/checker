require 'mail'
YOUR_EMAIL = '...'
YOUR_EMAIL_PASSWORD = '...'

class Mailer
  def initialize(email_body)
    options = { :address              => 'smtp.gmail.com',
                :port                 => 587,
                :user_name            => YOUR_EMAIL,
                :password             => YOUR_EMAIL_PASSWORD,
                :authentication       => 'plain',
                :enable_starttls_auto => true  }

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to 'alert@pokupon.ua'
      from YOUR_EMAIL
      subject 'Ошибка Доступности Сайта'
      body email_body
    end
  end
end