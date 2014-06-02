function selected_genotypes = rouletteSelection(genotypes, select_number)
  selected_genotypes = [];

  genotypes_fitness = calculateFitness(genotypes);
  genotypes_probability = cumsum(genotypes_fitness./sum(genotypes_fitness));

  for i=1:select_number
    idx = genotypes_probability > rand;
    selected_genotypes = [genotypes(find(idx)(1), :) ; selected_genotypes];
  end
end
