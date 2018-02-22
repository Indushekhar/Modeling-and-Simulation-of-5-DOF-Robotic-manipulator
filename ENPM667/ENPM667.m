%Simulation%

prompt = 'Input Joint 1 Desired Angle in Degree ';
j1 = input(prompt);
prompt = 'Input Joint 2 Desired Angle in Degree ';
j2 = input(prompt);
prompt = 'Input Joint 3 Desired Angle in Degree ';
j3 = input(prompt);
prompt = 'Input Joint 4 Desired Angle in Degree ';
j4 = input(prompt);
prompt = 'Input Joint 5 Desired Angle in Degree ';
j5 = input(prompt);
prompt = 'Input Joint 1 Desired Velocity ';
j1vel = input(prompt);
prompt = 'Input Joint 2 Desired Velocity ';
j2vel = input(prompt);
prompt = 'Input Joint 3 Desired Velocity';
j3vel = input(prompt);
prompt = 'Input Joint 4 Desired Velocity';
j4vel = input(prompt);
prompt = 'Input Joint 5 Desired Veclocity ';
j5vel = input(prompt);
sys = 'ENPM667_FinalProject';
joint1 = strcat(sys,'/Input1/');
joint2 = strcat(sys,'/Input2/');
joint3 = strcat(sys,'/Input3/');
joint4 = strcat(sys,'/Input4/');
joint5 = strcat(sys,'/Input5/');
joint1velocity = strcat(joint1,'Ramp');
joint2velocity = strcat(joint2,'Ramp');
joint3velocity = strcat(joint3,'Ramp');
joint4velocity = strcat(joint4,'Ramp');
joint5velocity = strcat(joint5,'Ramp');
joint1direction = strcat(joint1,'Gain');
joint2direction = strcat(joint2,'Gain');
joint3direction = strcat(joint3,'Gain');
joint4direction = strcat(joint4,'Gain');
joint5direction = strcat(joint5,'Gain');

joint1angle = strcat(joint1,'Saturation');
joint2angle = strcat(joint2,'Saturation');
joint3angle = strcat(joint3,'Saturation');
joint4angle = strcat(joint4,'Saturation');
joint5angle = strcat(joint5,'Saturation');
open_system(sys);

%joint velocities by modifying slope of ramp input%
set_param(joint1velocity,'Slope',num2str(j1vel));
set_param(joint2velocity,'Slope',num2str(j2vel));
set_param(joint3velocity,'Slope',num2str(j3vel));
set_param(joint4velocity,'Slope',num2str(j4vel));
set_param(joint5velocity,'Slope',num2str(j5vel));

if((strcmp(j1,'NaN')==0)&&(strcmp(j2,'NaN')==0)&&(strcmp(j3,'NaN')==0)&&(strcmp(j4,'NaN')==0)&&(strcmp(j5,'NaN')==0))
     if(sign(str2double(j1))==1)
        set_param(joint1direction,'Gain','1');
        set_param(joint1angle,'UpperLimit',num2str(j1));
    elseif(sign(str2double(j1))==-1)
        set_param(joint1direction,'Gain','-1');
        set_param(joint1angle,'LowerLimit',num2str(j1));
    else
        set_param(joint1direction,'Gain','1');
        set_param(joint1angle,'UpperLimit',num2str(j1));
    end
    if(sign(str2double(j2))==1)
        set_param(joint2direction,'Gain','1');
        set_param(joint2angle,'UpperLimit',num2str(j2));
    elseif(sign(str2double(j2))==-1)
        set_param(joint2direction,'Gain','-1');
        set_param(joint2angle,'LowerLimit',num2str(j2));
    else
        set_param(joint2direction,'Gain','1');
        set_param(joint2angle,'UpperLimit',num2str(j2));
    end
    if(sign(str2double(j3))==1)
        set_param(joint3direction,'Gain','1');
        set_param(joint3angle,'UpperLimit',num2str(j3));
    elseif(sign(str2double(j3))==-1)
        set_param(joint3direction,'Gain','-1');
        set_param(joint3angle,'LowerLimit',num2str(j3));
    else
        set_param(joint3direction,'Gain','1');
        set_param(joint3angle,'UpperLimit',num2str(j3));
    end
    if(sign(str2double(j4))==1)
        set_param(joint4direction,'Gain','1');
        set_param(joint4angle,'UpperLimit',num2str(j4));
    elseif(sign(str2double(j4))==-1)
        set_param(joint4direction,'Gain','-1');
        set_param(joint4angle,'LowerLimit',num2str(j4));
    else
        set_param(joint4direction,'Gain','1');
        set_param(joint4angle,'UpperLimit',num2str(j4));
    end
    if(sign(str2double(j5))==1)
        set_param(joint5direction,'Gain','1');
        set_param(joint5angle,'UpperLimit',num2str(j5));
    elseif(sign(str2double(j5))==-1)
        set_param(joint5direction,'Gain','-1');
        set_param(joint5angle,'LowerLimit',num2str(j5));
    else
        set_param(joint5direction,'Gain','1');
        set_param(joint5angle,'UpperLimit',num2str(j5));
    end
end

  sim(sys);
save_system(sys);
status = 1;