-> start

### OPTIONAL NEGATIVE PREFIX
# Possible with all tenses except perfect
start -> stem     <hin:hin-{>   [+neg,tm=sub];[+neg,tm=prs];[+neg,tm=pst];[+neg,tm=imv];[+neg,tm=contemp]
# Absence of hin- does not necessarily mean -neg
# '{' that starts the stem
start -> stem     [:{]

### STEM
# Irregular verbs go to different states
stem            +irr_stem+
stem -> der     +v_stems+
# To skip derivational suffixes...
# stem -> stem_end  +v_stems+

### DERIVATIONAL SUFFIXES
## Passive
# T- is needed to get -tam- with roots ending in dh-: nyaatam-, dubbatam-
der -> pass      <Tam:-am>    [der=[+ps,-autoben]]
pass -> stem_end  [:]         [der=[-cs]]
## Passive + causative (unfortunately not distinguished from causative + passive)
pass -> stem_end  <siis:-sis> [der=[+cs]]
## Causative
der -> caus       <s:-sis>    [der=[+cs,-ps,-autoben]]
caus -> caus1     [i:;ii:]
caus1 -> stem_end [s:]
# exclude the possibility of -s only since it's not really productive
#caus -> stem_end  [:]
## Autobenefactive
der -> autoben1   [a:;aa:]
autoben1 -> stem_end <dh:-adh> [der=[+autoben,-ps,-cs]]
## Causative + passive (not distinguished from passive + causative)
der -> stem_end  <fam:-sis-am>    [der=[+ps,+cs,-autoben]]
## Autobenefactive + passive
der -> stem_end  <fadh:-sis-adh>   [der=[+ps,-cs,+autoben]]
## To morpheme boundary before suffixes
der -> stem_end   [:]      [der=[-ps,-cs,-autoben]]

### STEM-SUFFIX BOUNDARY
# Morpheme boundary separating stem and suffixes
# '}' that ends the stem
stem_end -> sbj   [+:}]

### SUBJECT SUFFIXES: -t-, -n-, -T-, -0-
## Non-finite forms: bypass subject and TAM endings
sbj -> nonfin     [:]      [sb=None,tm=None]
## No subject suffixes for imperative; go straight to imv state
sbj -> imv        [:]      [tm=imv]
## No subject suffixes for subordinate/contemporary negative
sbj -> main      <in:-in>     [tm=sub,+neg];[tm=contemp,+neg]
## Subject suffixes for other forms
sbj -> sbj1       [:]      [tm=prs];[tm=pst];[tm=sub,-neg];[tm=contemp,-neg];[tm=prf]
# -t-: 2 or 3sf
sbj1 -> sbj_t     <t:-t>   [sb=[+p2]];[sb=[-p1,-p2,-pl,+fem]]
sbj_t -> tam      [:]      [sb=[+p2,+pl],tm=prs,-neg]
# -tan(i): 2p; past, present, subordinate, contemporary, perfect
sbj_t -> sbj_tan <an:-an>  [sb=[+p2,+pl]]
sbj_tan -> main   <(i):>   [tm=pst,-neg];[tm=prs];[tm=sub,-neg]
sbj_tan -> end    <uu:-uu> [tm=contemp,-neg]
sbj_tan -> prf    [ii:]    [tm=prf]
# 3sf pres
sbj_t -> main     <i:-i>   [sb=[-p1,-p2,-pl,+fem],tm=prs,-neg]
# all TAM for 2s; all but prs,-neg for 3sf; nothing for 2p
sbj_t -> tam      [:]      [sb=[+p2,-pl]];[sb=[-p1,-p2,-pl,+fem]]
# -n-: 1p
sbj1 -> sbj_n     [n:]
sbj_n -> tam      <:-n>    [sb=[+p1,-p2,+pl]]
# past negative for all subjects
sbj_n -> main     <e:-ne>  [tm=pst,+neg]
# -0-: 1s
sbj1 -> tam       [:]      [sb=[+p1,-p2,-pl]]
# -T-: 3; only surfaces following -dh-
sbj1 -> sbj_3     [T:]     [sb=[-p1,-p2]]
# 3sm, 3p
sbj_3 -> tam      [:]      [sb=[-fem,-pl]];[sb=[+pl],tm=prs,-neg]
# 3p: -an(i); past, present, subordinate, contemporary, perfect
sbj_3 -> sbj_an  <an:-an>  [sb=[+pl]]
sbj_an -> main   <(i):>    [tm=pst,-neg];[tm=prs];[tm=sub,-neg]
sbj_an -> prf    [ii:]     [tm=prf]
sbj_an -> end    <uu:-uu>  [tm=contemp,-neg]
sbj_an -> end    <ii:-ii>  [tm=contemp,-neg]

### TAM endings
## Present and past
# Present 1s, 1p, 3sm, 2s
tam -> main       <a:-a>     [tm=prs,-neg,sb=[+p1,-p2]];[tm=prs,-neg,sb=[-p1,-p2,-fem,-pl]];[tm=prs,-neg,sb=[-p1,+p2,-pl]]
# Past 1s, 1p, 3sm, 3sf, 2s (not 2p, 3p)
tam -> main       <e:-e>     [tm=pst,-neg]
## Perfect
tam -> prf        <ee:-e>    [tm=prf]
## Subordinate; present 2, 3 plural
tam -> end        <u:-u>     [tm=sub,-neg];[tm=prs,+neg]
tam -> main       <u:-u>     [tm=prs,sb=[-p1,+pl],-neg]
## Contemporary
tam -> end        <uu:-uu>    [tm=contemp,-neg]
## Imperative affirmative: singular and plural
imv -> main       <aa:-aa>    [-inter,sb=[-p1,+p2,+pl],-neg]
imv -> main       <I:-i>     [-inter,sb=[-p1,+p2,-pl],-neg]
## Imperative negative: i/ii difference is dialectal? (C G-M)
# Ti(i)n(aa): (T only surfaces after -dh-)
imv -> imv_neg    [T:]     [+neg,-inter]
imv_neg -> imv_i  [i:;ii:]
imv_i -> imv_in   <n:-in>
# singular and plural
imv_in -> main    [:]      [sb=[-p1,+p2,-pl]]
imv_in -> main    <aa:-aa>    [sb=[-p1,+p2,+pl]]
## Perfect: subject agreement is duplicated in the TAM suffix
# all begin with -r; -t also possible for 2s, 2p, and 3sf
prf -> prf1       <r:-r>
prf -> prf1       <t:-r>    [sb=[+p2]];[sb=[-p1,-p2,+fem,-pl]]
# 1s, 3sm
prf1 -> main      <a:-a>    [sb=[+p1,-p2,-pl]];[sb=[-p1,-p2,-fem,-pl]]
# 2s 
prf1 -> main      <ta:-ta>   [sb=[-p1,+p2,-pl]]
# 3sf
prf1 -> main      <ti:-ti>   [sb=[-p1,-p2,+fem,-pl]]
# 1p
prf1 -> main      <ra:-na>   [sb=[+p1,-p2,+pl]]
# 2p
prf1 -> main      <tu:-tu>   [sb=[-p1,+p2,+pl]]
# 3p
prf1 -> main      <u:-u>    [sb=[-p1,-p2,+pl]]

### MAIN CLAUSE VERB SUFFIXES
## Lengthen final vowel for "continuative": interrogative or past/imperative sequence
main -> main1      <L:-L>    [+cont,cnj=None]
main -> main1      [:]     [-cont,cnj=None]
# Past continuative can have 1s subject suffix in compound tenses
main1 -> 1s_sb     [:]     [tm=pst,+cont,-dat,-ins]
# Present can have 1s subject suffix in compound tenses
main -> 1s_sb      [:]     [tm=prs,-cont,-dat,-ins,cnj=None]
## Case suffixes
# 3 person dative; lengthen V and add -f(i)
main1 -> end    <Lf(i):-f> [+dat,-ins,-1s_sb]
main1 -> end     [:]     [-dat,-ins,-1s_sb]
# 3 person instrumental; lengthen V and add -n(i)
main1 -> end    <Ln(i):-n> [+ins,-dat,-1s_sb]
## Various conjunctive suffixes, apparently only possible with -cont.
## Assume they cannot follow +cont or case suffixes
## and that 1s_sb cannot follow (this is probably WRONG)
main -> main2     [:]      [-cont,-dat,-ins,-1s_sb]
main2 -> end      <Ltii:-tii>  [cnj=ti,tm=imv]
main2 -> end      <Lti:-ti>   [cnj=ti,tm=pst]
# The L seems not to be required with -s
main2 -> s1       <(L)s:-s>  [cnj=s]
s1 -> end         <(i):>
main2 -> end      <Lf(i):-f> [cnj=f]
main2 -> end      <dhaaf:-dhaaf> [cnj=f]
main2 -> end      <tti:-tti>   [cnj=tti]
main2 -> end      <llee:-llee>  [cnj=llee]
main2 -> end      <yyuu:-yyuu>  [cnj=yyuu]
main2 -> end       [:]     [cnj=None]

###  SUFFIXES FOR NON-FINITE FORMS: INFINITVE, PARTICIPLE, AGENT, GERUND
# Infinitive; a noun so can have noun suffixes
nonfin -> noun     <Cuu:-uu>   [+inf,-prt,-ger,-agt]
# Participle; can have 1s subj -n in compound tenses
nonfin -> 1s_sb    <aa:-aa>    [+prt,-inf,-agt,-ger]
# Agent; these are nouns so they can have noun suffixes
nonfin -> noun     <aa:-aa>    [+agt,-fem,-inf,-prt,-ger]
nonfin -> noun     <tuu:-tuu>   [+agt,+fem,-inf,-prt,-ger]
# Gerund; can probably have 1s subj -n
nonfin -> 1s_sb    <naan:-naan>  [+ger,-inf,-prt,-agt]

### NOUN SUFFIXES: FOR INFINITIVES AND AGENTS
## Cases: base (bs), subject (sb), genitive (gen), dative (dat), instrumental (ins),
# ablative (abl), locative (loc) [vocative (voc)]
# Base, genitive
# No suffix can mean genitive because vowel is already long (omit??)
noun -> n_conj     [:]      [case=bs];[case=gen]
# Subject
# -n works for -uu (infinitive, fem. agent) and -aa (masc. agent)
noun -> end        <n:-n>    [case=sb]
# Dative, instrumental, ablative
noun -> n_conj     <f:-f>     [case=dat]
noun -> n_dhaa    <dhaa:-dhaa>
n_dhaa -> n_conj   [:]      [case=dat];[case=ins];[case=abl]
n_dhaa -> n_conj   <f:-f>     [case=dat]
noun -> n_conj     <n:-n>     [case=ins]
n_dhaa -> n_conj   <n:-n>     [case=ins]
# Locative
noun -> n_conj     <tti:-tti> [case=loc]

### NOUN CONJUNCTIONS; FOCUS (probably not complete)
# -(V)s(i) and -Vf(i)
n_conj -> n_s     <(L)s:-s>    [cnj=s]
n_s -> end        [i:;:]     [-1s_sb]
n_s -> 1s_sb       [:]       [+1s_sb]
n_conj -> n_f     <Lf:-f>      [cnj=f]
n_f -> 1s_sb       [:]       [+1s_sb]
n_f -> end        [i:;:]     [-1s_sb]
n_conj -> 1s_sb   <simmoo:-simmoo>  [cnj=simmoo]
n_conj -> 1s_sb   <oo:-oo>      [cnj=oo]
n_conj -> 1s_sb   <woo:-woo>     [cnj=woo]
n_conj -> 1s_sb   <llee:-llee>    [cnj=llee]
n_conj -> 1s_sb   <mmoo:-mmoo>    [cnj=mmoo]
n_conj -> 1s_sb   <moo:-moo>     [cnj=moo]
# -tu is not really a conjunction, but seems not to co-occur with any of them
n_conj -> 1s_sb   <tu:-tu>      [cnj=tu]
# No conjunction
n_conj -> 1s_sb   [:]        [cnj=None]

### 1S SUBJECT SUFFIX
# N is realized as -an following consonants, -n following vowels
# so we need a special character for it (realized in N.fst)
1s_sb -> end       <N:-n>      [+1s_sb,sb=[+p1,-p2,-pl]];[+1s_sb,sb=None]
1s_sb -> end       [:]       [-1s_sb]

end ->
