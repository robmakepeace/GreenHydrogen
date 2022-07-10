%Green Hydrogen Main script
%Robert Makepeace
%First written 09/07/2022
%Last updated 10/07/2022

%System Handles
close all
clearvars
clc

%Execution Parameters
global Self
Self.run_graphics = 1; 
Self.run_file = 1; 
Self.run_print = 1; 

%Record execution time
tic() 

main_print("Green Hydrogen Exportation Results", 'w')
main_print(strcat("Executed: ",string(datetime('now'))),'a')

%Define constants
constants_physical();
constants();
constants_conversion();
constants_fuel();
constants_transport();
constants_casestudies();
constants_regions();

%Execute Analyslis scripts
analysis_production();
analysis_transport();
analysis_conversion();
analysis_casestudies();
analysis_regions();

%Execute Visualisation scripts
%visualise_australia_plot();
% Keep this one commented out - runs slow. 
%visualise_world_plots();

%Display elapsed execution time
main_print(strcat("\nElapsed time is ",string(toc())," seconds."),'a');