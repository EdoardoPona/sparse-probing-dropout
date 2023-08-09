# # set environment variables
# export SPARSE_PROBING_ROOT=/home/ep/Documents/superposition/sparse-probing-dropout
# export PATH=$SPARSE_PROBING_ROOT:$PATH

# export HF_DATASETS_OFFLINE=0
# export TRANSFORMERS_OFFLINE=0

# export RESULTS_DIR=/home/ep/Documents/superposition/sparse_probing_results
# export FEATURE_DATASET_DIR=/home/ep/Documents/superposition/sparse_probing_datasets
# export TRANSFORMERS_CACHE=/home/ep/Documents/superposition/sparse_probing_downloads
# export HF_DATASETS_CACHE=/home/ep/Documents/superposition/sparse_probing_downloads
# export HF_HOME=/home/ep/Documents/superposition/sparse_probing_downloads


sleep 0.1  # wait for paths to update

# activate environment and load modules
# source $SPARSE_PROBING_ROOT/venv/bin/activate

# PYTHIA_MODELS=('pythia-70m' 'pythia-160m') #'pythia-410m' 'pythia-1b' 'pythia-1.4b' 'pythia-2.8b' 'pythia-6.9b')
PYTHIA_MODELS=('pythia-160m-alldropout-0.1' 'pythia-160m-hiddendropout-0.1' 'pythia-160m-attndropout-0.1') 
batch_size=1

for model in "${PYTHIA_MODELS[@]}"
do
    # python -u get_activations.py \
    #     --experiment_name all_context_features_test \
    #     --experiment_type activation_probe_dataset \
    #     --model "$model" \
    #     --feature_dataset programming_lang_id.pyth.512.-1 \
    #     --activation_aggregation mean \
    #     --seed 42

    # python -u get_activations.py \
    #     --experiment_name all_context_features_test \
    #     --experiment_type activation_probe_dataset \
    #     --model "$model" \
    #     --feature_dataset distribution_id.pyth.512.-1 \
    #     --activation_aggregation mean \
    #     --seed 42 
    
    # python -u get_activations.py \
    #     --experiment_name all_context_features_test \
    #     --experiment_type activation_probe_dataset \
    #     --model "$model" \
    #     --feature_dataset natural_lang_id.pyth.512.-1 \
    #     --activation_aggregation mean \
    #     --seed 42 

    # python -u get_activations.py \
    #     --experiment_name all_context_features_test \
    #     --experiment_type activation_probe_dataset \
    #     --model "$model" \
    #     --feature_dataset natural_lang_id.pyth.512.-1 \
    #     --seed 42 
    echo batch is $batch_size
    python -u "${SPARSE_PROBING_ROOT}/get_activations.py" \
        --experiment_name compound_apd \
        --experiment_type activation_probe_dataset \
        --model "$model" \
        --batch_size $batch_size \
        --feature_dataset compound_words.pyth.24.-1 \
        --seed 42

done
