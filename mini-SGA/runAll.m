close all;
clear all;

%%% global parameters %%%
MAX_ALPHABET_VALUE = 2^32-1;
POPULATION_COUNT = 100;
GENERATION_COUNT = 50;
TEST_RUNS = 30;

fitness = [];
test_runs_max_fit = ones(TEST_RUNS, GENERATION_COUNT);

for it=1:TEST_RUNS
  %%% init population %%%
  init_population = randi(MAX_ALPHABET_VALUE, POPULATION_COUNT, 1);
  max_fitnesses = runSGA(init_population, GENERATION_COUNT);
  test_runs_max_fit(it, :) = max_fitnesses;
end

figure(1);
hold on;
title('Mean fitness per generation');
xlabel('No. of generations');
ylabel('Fitness');
plot(1:GENERATION_COUNT, mean(test_runs_max_fit), 'b');
plot(1:GENERATION_COUNT, max(test_runs_max_fit), 'r');
legend('Mean fitness', 'Max fitness');
hold off;
