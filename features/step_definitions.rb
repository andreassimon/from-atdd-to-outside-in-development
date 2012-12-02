# encoding: utf-8

require "rspec"

Wenn /^ich eine "(.*?)" "(.*?)" mit "(.*?)" bestelle$/ do |groesse, sorte, extras|
  extras_list = extras.split(',').map do |extra|
    extra.gsub(/^ +/, '')
  end

  @pizza = Pizza.new(groesse, sorte, extras_list)
end

Dann /^kostet die Pizza "(.*?)"$/ do |erwarteter_preis|
  @pizza.preis.should == erwarteter_preis.gsub(',', '.').to_f
end



class Pizza

  def initialize(groesse, sorte, extras)
    @groesse, @sorte, @extras = groesse, sorte, extras

    class << @groesse
      def grundpreis
        {
          "kleine" => 4.50,
          "mittlere" => 5.50,
          "große" => 10.50,
          "Familien" => 16.50
        }[self]
      end
    end

    class << @sorte
      def aufpreis
        if self == "Calzone"
          0.50
        else
          0.00
        end
      end
    end

    class << @extras
      def aufpreis
        self.map(&:aufpreis).reduce :+
      end
    end

    @extras.each do |extra|

      class << extra
        def aufpreis
          if ["Extra Käse", "Extra Salami", "Extra Thunfisch"].include? self
            0.50
          else
            0.00
          end
        end
      end

    end
  end

  def preis
    @groesse.grundpreis + @sorte.aufpreis + @extras.aufpreis
  end

end
