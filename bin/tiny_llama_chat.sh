#!/bin/bash
# Load necessary modules and activate virtual environment
module load python/3.8  # Example: Load Python module
source ~/envs/llama/bin/activate

# Launch the TinyLlama model server
python3 -m tiny_llama.chat_server --model_path /path/to/tiny_llama_1.1b

# Forward port for OOD to interact with the API
echo "Forwarding port for TinyLlama chat..."
ssh -N -L ${HOSTNAME}:5000:localhost:5000 your_hpc_node &

echo "TinyLlama model is running, chat server ready."
