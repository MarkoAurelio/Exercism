class Complement
    DNA = "GCTA"
    RNA = "CGAU"

    def self.of_dna(strand)
        strand.tr(DNA,RNA)
    end
  end