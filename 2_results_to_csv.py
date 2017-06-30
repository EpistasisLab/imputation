import pickle as pkl
import numpy as np
import pandas as pd

score = pkl.load(open('./data/all_patients/all_patients_panel_scores.p', 'rb'))
print(score)
rfc_dict = {}
for key in score:
    rfc_dict[key] = score[key]['rfc']

real_df = pd.DataFrame.from_dict(rfc_dict)
real_df.to_csv('./data/all_patients/all_panels.csv')
