function phenotype = decodeGenotype(genotype)
  phenotype = sum(genotype.*2.^(length(genotype)-1:-1:0), 2);
end
