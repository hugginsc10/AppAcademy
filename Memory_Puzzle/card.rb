class Card
    
    attr_reader :card_value, :face_up
    def initialize(card)
        @card_value = card
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
        @card_value 
    end

    def to_s
        reveal.to_s
    end

    def ==(card)
        self.card_value == card.card_value
    end

end