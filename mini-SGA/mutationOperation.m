function mutated_genotype = mutationOperation(genotype, flip_bit_idx)
  genotype_len = size(genotype, 2);
  mutated_genotype = zeros(1, genotype_len);
  if nargin == 1
    flip_bit_idx = randi(genotype_len);
  end
  mutated_genotype = genotype;
  flipped_bit_value = abs(genotype(1, flip_bit_idx) - 1);
  mutated_genotype(1, flip_bit_idx) = flipped_bit_value;
end
