
t1 = tic;

% ------------------------------------------------------------------------
% COMSOL :: comsol specific settings
% ------------------------------------------------------------------------
fprintf('Loading Comsol model')
comsol.model_str=char('optAct_MSC_b');		% zu simulierendes Modell
comsol.model=mphload(comsol.model_str);		% Comsol-Modell in Matlab laden


% ------------------------------------------------------------------------
% COMSOL :: model tags ~ (studys, datasets, simulation results)
% ------------------------------------------------------------------------
comsol.SysAdjsys=char('std1');
comsol.SimSys=char('std2');


% ------------------------------------------------------------------------
% Ansto�en der Simulation in Comsol & postprocessing
% ------------------------------------------------------------------------
fprintf('Start the Comsol simulation')

t2 = tic;
comsol.model.study(comsol.SimSys).run();  % System
T2 = toc(t2);

t4 = tic;
comsol.model.study(comsol.SysAdjsys).run();  % Adjungiertes System 
T4 = toc(t4);

T1 = toc(t1);

fprintf('Time needed for complete matlab script: %d\n',T1);
fprintf('Time needed for system simulation: %d\n',T2);
fprintf('Time needed for adj. system simulation: %d\n',T4);
