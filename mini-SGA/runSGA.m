function [max_fitnesses] = runSGA(init_phenotypes, max_generations)
  genotypes = encodePhenotype(init_phenotypes);
  max_fitnesses = [];

  for it=1:max_generations
    offspring = [];
    %%% mutation %%%
    mutation_parents = rouletteSelection(genotypes, 10);
    for i=1:10
      offspring = [mutationOperation(mutation_parents(i, :)); offspring];
    end
    %%% crossover %%%
    crossover_parents = rouletteSelection(genotypes, 90);
    for i=1:2:90
      offspring = [crossoverOperation(crossover_parents(i:i+1, :)) ; offspring];
    end
    genotypes = offspring;

    genotypes_fitnesses = calculateFitness(genotypes);
    generation_max_fitness = max(genotypes_fitnesses);
    max_fitnesses = [max_fitnesses generation_max_fitness];
  end
end
