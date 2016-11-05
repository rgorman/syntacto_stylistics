for $word in //word
where $word/@relation="COORD" and contains($word/@postag, "d")
return $word
