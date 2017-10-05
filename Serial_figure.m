%%
clc
clear
%%
%out1 = instrfind('Port','COM1');

%fclose(out1);

s = serial('COM5','BaudRate',9600,'DataBits',8,'Parity', 'none', 'FlowControl', 'software','Stopbits',2);

%s.ReadAsyncMode = 'manual';
set(s,'InputBufferSize',1);

s.DataTerminalReady='off';
s.RequestToSend='off';

fopen(s);


%%
n=0;
i=1;
k=1;
count=5000;
t=1;
while(1)
    count=count-1;
    %t(i)=fread(s);
    [x,y] = ginput(4);
    
    i=i+1;
    drawnow;
    plot(x,y,'-.dk','linewidth',1.8), axis([0 1 0 1] )
    n=n+1;
    if n==50
        n=0;
        k=k+50;
        
    end
  if count==0
      break;
  end
   
end

fclose(s);