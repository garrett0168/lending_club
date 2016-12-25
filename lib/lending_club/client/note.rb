require 'bigdecimal'

module LendingClub
  class Note

    ATTRIBUTES = [
      :loan_status,
      :loan_id,
      :portfolio_name,
      :note_id,
      :grade,
      :loan_amount,
      :accrued_interest,
      :note_amount,
      :purpose,
      :interest_rate,
      :portfolio_id,
      :order_id,
      :loan_length,
      :issue_date,
      :order_date,
      :loan_status_date,
      :credit_trend,
      :current_payment_status,
      :can_be_traded,
      :payments_received,
      :next_payment_date,
      :principal_pending,
      :interest_pending,
      :interest_received,
      :principal_received
    ]

    # @return [String] Loan status
    attr_reader :loan_status
    # @return [Integer] Loan Id
    attr_reader :loan_id
    # @return [String, nil] Portfolio name
    attr_reader :portfolio_name
    # @return [Integer] Note Id
    attr_reader :note_id
    # @return [String] Grade
    attr_reader :grade
    # @return [BigDecimal] Loan amount
    attr_reader :loan_amount
    # @return [BigDecimal] Accrued Interest
    attr_reader :accrued_interest
    # @return [BigDecimal] Note amount
    attr_reader :note_amount
    # @return [String] Purpose
    attr_reader :purpose
    # @return [Number] Interest rate
    attr_reader :interest_rate
    # @return [Integer, nil] Portfolio Id
    attr_reader :portfolio_id
    # @return [Integer] Order Id
    attr_reader :order_id
    # @return [Integer] Loan length
    attr_reader :loan_length
    # @return [String, nil] Issue date
    attr_reader :issue_date
    # @return [String] Order date
    attr_reader :order_date
    # @return [String] Loan status date
    attr_reader :loan_status_date
    # @return [String] Credit trend
    attr_reader :credit_trend
    # @return [String, nil] Current payment status
    attr_reader :current_payment_status
    # @return [Boolean] Can be traded
    attr_reader :can_be_traded
    # @return [BigDecimal] Payments received
    attr_reader :payments_received
    # @return [String, nil] Next payment date
    attr_reader :next_payment_date
    # @return [BigDecimal] Principal pending
    attr_reader :principal_pending
    # @return [BigDecimal] Interest pending
    attr_reader :interest_pending
    # @return [BigDecimal] Interest received
    attr_reader :interest_received
    # @return [BigDecimal] Principal received
    attr_reader :principal_received
    # @return [String, nil] Last payment date
    attr_reader :last_payment_date
    # @return [String] Application type
    attr_reader :application_type

    def initialize(data_hash)
      @loan_status = data_hash['loanStatus'].to_s
      @loan_id = Integer(data_hash['loanId'])
      @application_type = data_hash['applicationType']
      if data_hash['portfolioName']
        @portfolio_name = data_hash['portfolioName'].to_s
      end
      @note_id = Integer(data_hash['noteId'])
      @grade = data_hash['grade'].to_s
      @loan_amount = BigDecimal.new(data_hash['loanAmount'].to_s)
      @accrued_interest = BigDecimal.new(data_hash['accruedInterest'].to_s)
      @note_amount = BigDecimal.new(data_hash['noteAmount'].to_s)
      @purpose = data_hash['purpose'].to_s
      @interest_rate = Float(data_hash['interestRate'])
      if data_hash['portfolioId']
        @portfolio_id = Integer(data_hash['portfolioId'])
      end
      @order_id = Integer(data_hash['orderId'])
      @loan_length = Integer(data_hash['loanLength'])
      if data_hash['issueDate']
        @issue_date = data_hash['issueDate'].to_s
      end
      @order_date = data_hash['orderDate'].to_s
      @loan_status_date = data_hash['loanStatusDate'].to_s
      @credit_trend = data_hash['creditTrend'].to_s
      if data_hash['currentPaymentStatus']
        @current_payment_status = data_hash['currentPaymentStatus'].to_s
      end
      @can_be_traded = !!data_hash['canBeTraded']
      @payments_received = BigDecimal.new(data_hash['paymentsReceived'].to_s)
      if data_hash['nextPaymentDate']
        @next_payment_date = data_hash['nextPaymentDate'].to_s
      end
      if data_hash['lastPaymentDate']
        @last_payment_date = data_hash['lastPaymentDate'].to_s
      end
      @principal_pending = BigDecimal.new(data_hash['principalPending'].to_s)
      @interest_pending = BigDecimal.new(data_hash['interestPending'].to_s)
      @interest_received = BigDecimal.new(data_hash['interestReceived'].to_s)
      @principal_received = BigDecimal.new(data_hash['principalReceived'].to_s)
    end

    def self.collection(data_hash)
      puts data_hash.inspect
      return [] unless data_hash['myNotes']
      data_hash['myNotes'].map do |loan|
        new(loan)
      end
    end

    def to_h
      ATTRIBUTES.reduce({}) do |h, attribute|
        h[attribute.to_s] = send(attribute)
        h
      end
    end

  end
end
