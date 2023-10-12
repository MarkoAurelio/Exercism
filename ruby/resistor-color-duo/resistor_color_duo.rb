class ResistorColorDuo
    class << self

        def value(colors)
            bands = %w[black brown red orange yellow green blue violet grey white]
            colors.take(2).map { |color| bands.index(color) }.join.to_i
        end
    end
end