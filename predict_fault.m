load RF_fault_model.mat

fault_time = 0.01;
idx = time > fault_time; %[output:119eab9d]

v = vout(idx);
i = iout(idx);

Vavg    = mean(v);
Vripple = max(v)-min(v);
Iavg    = mean(i);
Iripple = max(i)-min(i);

sample = [Vavg Vripple Iavg Iripple];

result = predict(RFmodel,sample);

disp("Detected Fault:")
disp(result)


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:119eab9d]
%   data: {"dataType":"error","outputData":{"errorType":"runtime","text":"Unrecognized function or variable 'time'."}}
%---
