function [solution_phenotype, solution_fitness, solution_mean_fitness] = runSGA(init_phenotypes, max_iterations)
  genotypes = encodePhenotype(init_phenotypes);

  for it=1:max_iterations
    genotypes_fitness = calculateFitness(genotypes);
    [solution_fitness, idx] = max(genotypes_fitness);

    if solution_fitness == 32
      solution_mean_fitness = mean(genotypes_fitness);
      solution_phenotype = decodeGenotype(genotypes(idx, :));
      break;
    end

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
  end

  result_fitness = calculateFitness(genotypes);
  [solution_fitness, idx] = max(result_fitness);
  solution_mean_fitness = mean(result_fitness);
  solution_phenotype = decodeGenotype(genotypes(idx, :));
end
