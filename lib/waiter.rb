class Waiter

    @@all = []

    attr_accessor :name, :experience

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meals|
            meals.waiter == self
        end
    end

    def best_tipper
        best_tipped = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped.customer
    end
end