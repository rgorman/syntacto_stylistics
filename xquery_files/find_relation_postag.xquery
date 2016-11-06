for $word in //word
where $word/@relation="AuxY" and contains($word/@postag, "c-")
return $word
