# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # 
  def transaction_link(t)
    counterparty=t['to']==current_card.email ? t['from'] : t['to']
    if counterparty==OPERATOR_ACCOUNT
      counterparty=t["memo"]
    end
    amount=t['amount'].to_f*(t['to']==current_card.email ? 1 : -1 )
    link_to "#{counterparty} #{number_to_currency(amount)}",t["txn_id"]
  end
end
