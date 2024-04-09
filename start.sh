dataset_list=(geolife)
dist_type_list=(frechet haus dtw edr)
seed_list=(666 555 444)
for dataset in ${dataset_list[@]}; do
    for dist_type in ${dist_type_list[@]}; do
        for seed in ${seed_list[@]}; do
            train_flag=${dataset}_${dist_type}_${seed}
            echo ${train_flag}
            nohup python train_trajsimi.py --dataset ${dataset} --trajsimi_measure_fn_name ${dist_type} --seed ${seed} > train_log/${train_flag} &
            PID0=$!
            wait $PID0
        done
    done
done
