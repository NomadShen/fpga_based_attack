import csv
import numpy as np
from tqdm import trange

import helper

trace_num = 20000 # number of tested traces
profile_num = 1000 # number of traces for profiling
data_folder = "../data"
correct_ans = 1

trace = []

trace_file1 = []    

threashold_l = 20

cnt = 0
cnt_sr2 = 0

c_confidence = []
w_confidence = []

# point of interest
with open(data_folder+"/profile_eva_0.csv", mode="r", encoding="utf-8-sig") as f:
    reader = csv.reader(f)
    header = next(reader)
    radix = next(reader)

    trace_poi = []

    for row in reader:
        trace_poi.append(int(row[8]))

feature = []

for i in range(len(trace_poi)):
    if trace_poi[i] < threashold_l :
        if len(feature) == 0 or i >= feature[-1]+4:
            feature.append(i)

print("Number of POIs:",len(feature))

# profiling garbler
avg_gar = np.zeros(len(feature))
for i in range(profile_num):
    trace_t = []
    with open(data_folder+"/profile_gar_"+str(i)+".csv", mode="r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        header = next(reader)
        radix = next(reader)


        for row in reader:
            trace_t.append(int(row[8]))

    avg_gar += np.array([trace_t[j] for j in feature])

avg_gar /= profile_num

# profiling evaluator
avg_eva = np.zeros(len(feature))
for i in range(profile_num):
    trace_t = []
    with open(data_folder+"/profile_eva_"+str(i)+".csv", mode="r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        header = next(reader)
        radix = next(reader)


        for row in reader:
            trace_t.append(int(row[8]))

    avg_eva += np.array([trace_t[j] for j in feature])

avg_eva /= profile_num

for i in trange(trace_num):

    trace = []

    for k in range(1,3):

        with open(data_folder+"/pt"+str(k)+"_"+str(i)+".csv", mode="r", encoding="utf-8-sig") as f:
            reader = csv.reader(f)
            header = next(reader)
            radix = next(reader)

            trace_t = []

            for row in reader:
                trace_t.append(int(row[8]))

            trace.append(trace_t)

    with open(data_folder+"/ref_"+str(i)+".csv", mode="r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        header = next(reader)
        radix = next(reader)

        trace_t = []

        for row in reader:
            trace_t.append(int(row[8]))

        trace_ref = trace_t

    x = range(len(trace[0]))

    g = []

    for i in range(2):
        g.append(np.array([trace[i][j] for j in feature]) - avg_gar)

    g.append(np.array([trace_ref[j] for j in feature]) - avg_eva)

    corr = np.corrcoef(g)[2][0:2]
    corr_sorted = sorted(corr)
    #print(corr)

    if corr.argmax(axis=0) == correct_ans:
        cnt += 1
    if corr_sorted[-2] == corr[correct_ans]:
        cnt_sr2 += 1
    # else:
    #     print(corr)


    if corr.argmax(axis=0) == correct_ans:    
        c_confidence.append(corr_sorted[-1] - corr_sorted[-2])
    else:
        w_confidence.append(corr_sorted[-1] - corr_sorted[-2])
    

print("accuracy\t", (cnt)/trace_num)
print("accuracy (sr2)\t", (cnt+cnt_sr2)/trace_num)
print("mean c_confidence\t",np.mean(c_confidence))
print("max c_confidence\t",np.max(c_confidence))
print("mean w_confidence\t",np.mean(w_confidence))
print("max w_confidence\t",np.max(w_confidence))