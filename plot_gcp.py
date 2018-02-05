import os
import sys
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import json
from scipy.signal import savgol_filter
import seaborn as sns
from matplotlib import rc
import matplotlib.patches as mpatches
# rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
# rc('text', usetex=True)


color_list = sns.color_palette("muted")
sns.palplot(color_list)

log_dir = 'gcp3-logs'

def ema(x, decay=0.99, init=0.):
  res = []
  prev = init
  for val in x:
    prev = decay * prev + (1 - decay) * val
    res.append(prev)

  return res

# Read in results
results = {}
for log_file in os.listdir(log_dir):
  if log_file.endswith('.json'):
    with open(os.path.join(log_dir, log_file), 'r') as f:
      env, optimizer, seed = log_file[:-5].split('-')
      key = (env, optimizer)
      # print(key, seed)
      if key not in results:
        results[key] = []
      result = []
      for line in f:
        result.append(json.loads(line.strip()))
      results[key].append(result)

envs = ['halfcheetah', 'walker2d', 'humanoid']
envs_titles = {'halfcheetah': 'HalfCheetah', 'walker2d': 'Walker2d', 'humanoid': 'Humanoid'}
colors = {}
for i, thing in enumerate(['v', 'q', 'disc', 'none']):
  colors[thing] = color_list[i]

fig, axes = plt.subplots(1, len(envs), figsize=(20, 6))
for envidx, env in enumerate(envs):
  i = 0
  print('envidx', envidx, 'env', env)
  for k, v in results.items():
    if k[0] == env:
      y = [[row['reward_batch'] for row in res] for res in v]
      for j, res in enumerate(y):
        axes[envidx].plot(np.arange(len(res)) * 5, ema(res, 0.95), color=colors[k[1]],
                 label='-'.join(k) if j == 0 else None)
      i += 1

      # Sorting and plotting legend entries
      handles, labels = axes[envidx].get_legend_handles_labels()
      import operator
      hl = sorted(zip(handles, labels),
                  key=operator.itemgetter(1))
      handles2, labels2 = zip(*hl)
      # axes[envidx].legend(handles2, labels2, loc='lower right')
    axes[envidx].set_title(envs_titles[env])

h1 = mpatches.Patch(color=color_list[0], label='State baseline')
h2 = mpatches.Patch(color=color_list[1], label='State-action baseline')
h3 = mpatches.Patch(color=color_list[2], label='Discounted value function with no baseline')
h4 = mpatches.Patch(color=color_list[3], label='No baseline')
leg = fig.legend(handles=[h3, h4, h1, h2], loc='lower center', ncol=4, prop={'size': 10})

fig.savefig('disc_value_all.png')
quit(1)

# Plot reward for lbfg/y
plt.figure()
i = 0
for k, v in results.items():
  if k[1] == 'lbfgs' and k[2] == 'y':
    y = [[row['reward_batch'] for row in res] for res in v]

    for j, res in enumerate(y):
      plt.plot(np.arange(len(res)) * 5, ema(res, 0.95), color=colors[i],
               label='-'.join(k) if j == 0 else None)
    i += 1
  plt.legend()
  plt.xlabel('Steps (thousands)')
  plt.ylabel('Reward')
  plt.title(control_alg)
  plt.savefig('plots/reward_lbfgs_y.png')

for k, v in results.items():
  plt.figure()
  fields = ['mse_none', 'mse_v', 'mse_q', 'mse_model']

  for i, res in enumerate(v):
    plt.subplot(len(v), 1, i+1)
    for j, field in enumerate(fields):
      y = [row[field]/row['mse_none'] for row in res]
      plt.plot(np.arange(len(y)) * 5, ema(y, 0.95, 1.), color=colors[j], label=field)
      plt.ylim(0.95, 1.05)

  plt.legend()
  plt.xlabel('Steps (thousands)')
  plt.ylabel('MSE relative to no baseline')
  plt.title('-'.join(k))
  plt.savefig('plots/mse_%s.png' % ('-'.join(k)))

