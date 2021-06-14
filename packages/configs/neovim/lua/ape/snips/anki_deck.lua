local anki_deck = {}

anki_deck.new = [[$1; $0;]]
anki_deck.inline_math = [[\( $0\)]]
anki_deck.block_math = [[\[ $0\] ]] -- How can I avoid the trailing whitespace here?
anki_deck.frac = [[\frac{$1}{$2} $0]]
anki_deck.bold = [[\textbf{$1} $0]]
anki_deck.vec = [[\vec{$1} $0]]
anki_deck.sqrt = [[\sqrt{$1} $0]]
anki_deck.times = [[\times $0]]
anki_deck.dot = [[\cdot $0]]
anki_deck.dotsc = [[\dotsc $0]]
anki_deck.lambda = [[\lambda $0]]
anki_deck.theta = [[\theta $0]]
anki_deck.R = [[\mathbb{R}^{$1} $0]]
anki_deck.sub = [[{$1}_{$2} $0]]
anki_deck.pow = [[{$1}^{$2} $0]]
anki_deck.Vert = [[\Vert $0 \Vert]]
anki_deck.cos = [[\cos{$1} $0]]
anki_deck.sin = [[\sin{$1} $0]]
anki_deck.tan = [[\tan{$1} $0]]
anki_deck.prime = [[\prime $0]]

return anki_deck
