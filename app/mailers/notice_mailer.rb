class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "t-oka_@nttpc.co.jp",
    subject: '【Achieve】ブログが投稿されました'
    
  end
  
  def sendmail_contact(contact)
    @contact = contact

    mail to: contact.email,
    subject: '【Achieve】お問い合わせを受け付けました'
    
  end
  
end
