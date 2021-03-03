class VentureCapitalist

    attr_accessor :total_worth
    attr_reader :name

    @@all =[]

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        rich=[]
        VentureCapitalist.all.each do |ven_cap| 
            if ven_cap.total_worth > 1000000000
                rich<<ven_cap.name
            end
        end
        rich        
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|fund_obj| fund_obj.venture_capitalist==self}
    end

    def portfolio
        self.funding_rounds.select {|fund| fund.startup}.uniq
    end

    def biggest_investment
        count = 0
        return_obj = []
        self.funding_rounds.each do |funds|
            if funds.investment > count
                count = funds.investment
                return_obj = funds
            end
        end
        return_obj
    
    end

    def invested(domain)
        investments = []
        self.funding_rounds.each do  |funds| 
            if funds.startup.domain == domain
                investments<<funds.investment
            end
        end
        investments.sum


    end








end
