function genotype = encodePhenotype(phenotype)
  binary_str = dec2bin(phenotype);
  genotype = toascii(binary_str) - 48;  % minus '0' ascii code
end
