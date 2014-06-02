function offspring_genotypes = crossoverOperation(parent_genotypes, cross_position)
  parent_len = size(parent_genotypes(1, :), 2);
  offspring_genotypes = zeros(2, parent_len);
  if nargin == 1
    cross_position = randi(parent_len);
  end
  offspring_genotypes(1, :) = [parent_genotypes(1, :)(1:cross_position) parent_genotypes(2, :)(cross_position+1:end)];
  offspring_genotypes(2, :) = [parent_genotypes(2, :)(1:cross_position) parent_genotypes(1, :)(cross_position+1:end)];
end
