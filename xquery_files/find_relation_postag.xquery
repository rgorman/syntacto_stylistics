for $word in //word
where $word/@relation="AuxY" and starts-with($word/@postag, "c-")
return $word
