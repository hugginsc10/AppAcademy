class Card
    attr_reader :face_value, :face_up
    def initialize(card)
        @face_value = card
        @face_up = false
    end

    def hide
        @face_up = false
    end
    def reveal
        @face_up = true
        @face_value
    end

    def to_s
        reveal.to_s
    end

    def ==(card)
        self.face_value == card.face_value
    end

end