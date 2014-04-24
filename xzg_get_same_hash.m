function [match_hash] = xzg_get_same_hash(L, L2)

if nargin < 2
   D = wavread('/home/kevin/record/34.wav');
   L = find_landmarks(D,8000);
   D2 = wavread('/home/kevin/record/34-70record.wav');
   L2 = find_landmarks(D2,8000);
end
time_count = zeros(size(L,1));
for i =1:size(L2,1);
    hash_record = L2(i,:);
    time_record = hash_record(1);
    for j=1:size(L,1);
        hash_origin = L(j,:);
        time_origin = hash_origin(1);
        time_diff = time_origin-time_record;
        if(time_diff > 0)
            if(hash_record(2:end) == hash_origin(2:end))
                time_count(time_diff) = time_count(time_origin-time_record) + 1;
                break
            end
        end
    end
end

max_hash = 0;
max_hash_time = 0;
for i = 1:size(time_count);
    if (time_count(i) > max_hash)
        max_hash = time_count(i);
        max_hash_time = i;
    end
end
match_hash = [];
for i = 1:size(L2,1);
    hash_record = L2(i,:);
    time_record = hash_record(1);
    for j = 1:size(L,1);
        hash_origin = L(j,:);
        time_origin = hash_origin(1);
        time_diff = (time_origin - time_record);
        if (time_diff == max_hash_time)
            if( hash_record(2:end) == hash_origin(2:end))
                match_hash = [match_hash;hash_record];
            end
            break
        end
    end
end

end