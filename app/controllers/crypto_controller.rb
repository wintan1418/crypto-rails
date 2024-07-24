class CryptoController < ApplicationController
  def index
    @currencies = Money::Currency.table.map do |_, currency|
      {
        iso_code: currency[:iso_code],
        name: currency[:name],
        subunit: currency[:subunit],
        subunit_to_unit: currency[:subunit_to_unit]
      }
    end
  end

  def check
    @currencies = Money::Currency.table.map do |_, currency|
      {
        iso_code: currency[:iso_code],
        name: currency[:name],
        subunit: currency[:subunit],
        subunit_to_unit: currency[:subunit_to_unit]
      }
    end

    @source_currency = params[:source_currency]
    @target_currency = params[:target_currency]
    @amount = params[:amount].to_f

    source_currency_details = Money::Currency.find(@source_currency)
    target_currency_details = Money::Currency.find(@target_currency)

    if source_currency_details.nil? || target_currency_details.nil?
      flash[:error] = "Invalid currency provided"
      redirect_to crypto_path and return
    end

    subunit_amount = @amount * source_currency_details.subunit_to_unit
    amount_in_source = Money.new(subunit_amount, @source_currency)
    rate_to_target = amount_in_source.exchange_to(@target_currency)

    @rate = rate_to_target.amount / target_currency_details.subunit_to_unit

    render :index
  rescue Money::Bank::UnknownRate => e
    flash[:error] = "Conversion rate not available for #{@source_currency} to #{@target_currency}"
    redirect_to crypto_path
  rescue => e
    flash[:error] = e.message
    redirect_to crypto_path
  end
end
