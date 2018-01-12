python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 1000 --control-variate-lr 1e-3 --log-file gcp2-logs/humanoid-none-1000_0.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 50000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 1111 --control-variate-lr 1e-3 --log-file gcp2-logs/humanoid-none-1111_1.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 50000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 2222 --control-variate-lr 1e-3 --log-file gcp2-logs/humanoid-none-2222_2.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 50000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 3333 --control-variate-lr 1e-3 --log-file gcp2-logs/humanoid-none-3333_3.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 50000 &
python main.py --env-name 'Humanoid-v1' --gamma 0.99 --tau 0.95 --baseline none --n-epochs 3000 --max-time 1000 --seed 4444 --control-variate-lr 1e-3 --log-file gcp2-logs/humanoid-none-4444_4.json --v-optimizer lbfgs --use-disc-avg-v --batch-size 50000 &
