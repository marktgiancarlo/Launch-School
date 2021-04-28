class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(h_strand)
    shorter_strand = [@strand, h_strand].min do |a,b|
      a.length <=> b.length
    end
    len_of_comp = shorter_strand.length
    differences = 0
    @strand[0, len_of_comp].each_char.with_index do |nuc, i|
      differences += 1 if nuc != h_strand[i]
    end
    differences
  end
end