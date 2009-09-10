class RegistrationNotifier < ActionMailer::Base
  

  def credentials(card,sent_at = Time.now)
    subject    'Here is your new CapCard'
    recipients "#{card.name} <#{card.email}>"
    from       'CapCard <capcard@stakeventures.com>'
    sent_on    sent_at
    
    body       :card=>card
  end

end
