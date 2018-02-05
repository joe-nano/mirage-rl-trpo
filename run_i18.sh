python main.py --env-name 'HalfCheetah-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/halfcheetah-none-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'HalfCheetah-v1' --gamma 0.99 --tau 0.95 --baseline v --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/halfcheetah-v-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'HalfCheetah-v1' --gamma 0.99 --tau 0.95 --baseline q --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/halfcheetah-q-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'HalfCheetah-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/halfcheetah-disc-5678.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 5000 &
python main.py --env-name 'Walker2d-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/walker2d-none-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Walker2d-v1' --gamma 0.99 --tau 0.95 --baseline v --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/walker2d-v-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Walker2d-v1' --gamma 0.99 --tau 0.95 --baseline q --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/walker2d-q-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Walker2d-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/walker2d-disc-5678.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 5000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/humanoid-none-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline v --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/humanoid-v-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline q --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/humanoid-q-5678.json --v-optimizer lbfgs --batch-size 5000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 5678 --control-variate-lr 1e-3 --log-file gcp3-logs/humanoid-disc-5678.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 5000 &
