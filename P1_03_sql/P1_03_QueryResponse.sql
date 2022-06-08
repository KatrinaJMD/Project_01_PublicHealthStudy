-- 10 pays le plus haut ratio dispo_alim/hab en protéines (kg)
SELECT pays, round(sum(dispo_prot/1000), 2) AS dispo_proteines
FROM dispo_alim
GROUP BY pays
ORDER BY dispo_proteines DESC
LIMIT 10;

-- 10 pays le plus haut ratio dispo_alim/hab en calories (kcal)
SELECT pays, round(sum(dispo_alim_kcal_p_j), 2) AS dispo_kcal
FROM dispo_alim
GROUP BY pays
ORDER BY dispo_kcal DESC
LIMIT 10;

-- 10 pays le plus faible ratio dispo_alim/hab en protéines (kg)
SELECT pays, round(sum(dispo_prot)/1000, 3) as faible_proteines
FROM dispo_alim
GROUP BY pays
ORDER BY faible_proteines ASC
LIMIT 10;

-- quantité totale (en kg) de produits perdus par pays en 2013
SELECT pays, round(sum(pertes), 2) AS pertes
FROM equilibre_prod
GROUP BY pays
ORDER BY pertes DESC
LIMIT 10;

-- 10 pays la proportion de personnes sous-alimentées est la plus forte
SELECT sn.pays, round((sn.nb_personnes/p.population) * 100, 2) AS undernoursished
FROM sous_nutrition sn
RIGHT JOIN population p
ON sn.code_pays = p.code_pays
ORDER BY undernoursished DESC
LIMIT 10;

-- 10 produits le ratio autres/dispo_int est le plus élevé
SELECT produit, round(sum(other_uses)/sum(dispo_int), 1) AS ratio_autres
FROM equilibre_prod
GROUP BY produit
ORDER BY ratio_autres DESC
LIMIT 10;