* DFE item universe 


select itemloc.item_loc_stat_c, count(*) from prd_assortment_ddn.inr_item_loc_exclude_master_nonretail inr
Left Join (SELECT DISTINCT co_loc_i, mdse_item_i, eff_d,expr_d,actv_f,item_loc_stat_c from prd_sho_fnd.mdse_item_loc
where expr_d_year >=2018
AND expr_d_month>=7
) as itemloc ON itemloc.mdse_item_i=inr.mdse_item_i
where itemloc.co_loc_i=inr.co_loc_i
AND itemloc.eff_d <= inr.rel_d
AND itemloc.expr_d >= inr.rel_d
group by itemloc.item_loc_stat_c;
