function execute(n,x){switch(n.type){case SWITCH:s=getValue(execute(n.discriminant,x));a=n.cases;var matchDefault=false;switch_loop:for(i=0,j=a.length;;i++){if(i==j){if(n.defaultIndex>=0){i=n.defaultIndex-1;matchDefault=true;continue};break};t=a[i];if(t.type==CASE){u=getValue(execute(t.caseLabel,x))}else{if(!matchDefault)continue;u=s};if(u===s)for(;;){if(t.statements.length)try{execute(t.statements,x)}catch(e if e==BREAK&&x.target==n){break switch_loop};if(++i==j)break switch_loop;t=a[i]}};break;default:throw "PANIC: unknown operation "+n.type+": "+uneval(n)};return v}

