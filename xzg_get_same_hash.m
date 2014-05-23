function [match_hash,one_differ] = xzg_get_same_hash(L, L2)
L2_hashes = L2(:,2:end);
match_hash = [];
one_differ = [];
for i =1: size(L,1)
    L_hash = L(i,2:end);
    b = ismember(L_hash,L2_hashes,'rows');
    if b
        match_hash = [match_hash;L(i,:)];
    end
    f1_add_1 = L_hash + [1 0 0];
    f2_add_1 = L_hash + [0 1 0];
    f1_sub_1 = L_hash + [-1 0 0 ];
    f2_sub_1 = L_hash + [0 -1 0];
    hash_one_diff =[f1_add_1;f2_add_1;f1_sub_1;f2_sub_1];
    s = intersect(hash_one_diff,L2_hashes,'rows');
    counts = size(s,1);
    if counts > 0
        one_differ =[one_differ;L(i,:)];
    end
end
end