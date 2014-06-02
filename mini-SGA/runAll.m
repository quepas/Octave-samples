%%% global parameters %%%
MAX_ALPHABET_VALUE = 2^32-1;
POPULATION_COUNT = 100;
GENERATION_COUNT = 50;
TEST_RUNS = 30;

%%% init population %%%
init_population = randi(MAX_ALPHABET_VALUE, POPULATION_COUNT, 1);

numbers = [];
fitness = [];
fitness_mean = [];

for it=1:TEST_RUNS
  [phenotype, fit, mean_fit] = runSGA(init_population, GENERATION_COUNT);
  numbers = [phenotype numbers];
  fitness = [fit fitness];
  fitness_mean = [mean_fit fitness_mean];
end

figure(1);
plot(1:TEST_RUNS, numbers);
figure(2);
plot(1:TEST_RUNS, fitness);
figure(3);
plot(1:TEST_RUNS, fitness_mean);