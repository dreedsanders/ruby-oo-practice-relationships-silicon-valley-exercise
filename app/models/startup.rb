class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all =[]
    @@domains =[]

    def initialize(name, founder, domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all<<self 
        @@domains<<self.domain
    end

    def pivot(domain, name)
        @domain = domain
        @name = name

    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        Startup.all.find {|startup_object| startup_object.founder == name}
    end

    def self.domains
        @@domains
    end

    def sign_contract(venture_cap, type, investment)
        FundingRound.new(self, venture_cap, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select {|fund_object| fund_object.startup == self}.count
    end

    def total_funds
        total=[]
        FundingRound.all.each do |fund_object|
            if fund_object.startup == self
                total<<fund_object.investment
            end
        end
        total.sum
    end

    def investors 
        investors=FundingRound.all.select {|fund_object| fund_object.startup == self}
        investors.map {|fun_object| fun_object.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|invest_object|invest_object.total_worth>1000000000}
    end
    


end

