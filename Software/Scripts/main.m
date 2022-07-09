%Green Hydrogen Main script
%Robert Makepeace
%First written 09/07/2022
%Last updated 09/07/2022

%System Handles
close all
clearvars
clc

%Execution Parameters
global run_graphics;
run_graphics = 1; 

%Record execution time
tic() 

%Define constants
constants_physical();
constants();

constants_conversion();
constants_fuel();
constants_transport();

constants_casestudies();
constants_regions();

%Execute Analyslis scripts
analysis_transport();
analysis_conversion();
analysis_casestudies();
analysis_regions();

%Execute Visualisation scripts
visualise_australia_plot();
% Keep this one commentted out - runs slow. 
%visualise_world_plots();

%Display elapsed execution time
toc()