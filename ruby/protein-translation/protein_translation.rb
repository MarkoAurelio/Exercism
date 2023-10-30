class InvalidCodonError < StandardError; end
class Translation
    def self.of_rna(strand)
        codons = strand.scan(/.{1,3}/).map(&:to_sym)

        proteins = []
        codons.each do |codon|
            raise InvalidCodonError.new unless (PROTEINS.include?(codon) || STOP.include?(codon)) && codon.size == 3
            break if STOP.include?(codon)

            proteins << PROTEINS[codon] 
        end

        proteins
    end

    private

    PROTEINS = {
        AUG: 'Methionine',
        UUU: 'Phenylalanine',
        UUC: 'Phenylalanine',
        UUA: 'Leucine',
        UUG: 'Leucine',
        UCU: 'Serine',
        UCC: 'Serine',
        UCA: 'Serine',
        UCG: 'Serine',
        UAU: 'Tyrosine',
        UAC: 'Tyrosine',
        UGU: 'Cysteine',
        UGC: 'Cysteine',
        UGG: 'Tryptophan',
    }

    STOP = [:UAA, :UAG, :UGA]
end
