function selected_genotypes = rouletteSelection(genotypes, select_number)
  selected_genotypes = [];

  genotypes_fitness = calculateFitness(genotypes);
  genotypes_probability = zeros(size(genotypes, 1), 1);
  genotypes_sum_probability = sum(genotypes_fitness);

  for k=1:length(genotypes_fitness)
    genotypes_probability(k, :) = genotypes_fitness(k)/genotypes_sum_probability;
  end
  genotypes_probability = cumsum(genotypes_probability);

  for i=1:select_number
    idx = genotypes_probability > rand;
    selected_genotypes = [genotypes(find(idx)(1), :) ; selected_genotypes];
  end
end
